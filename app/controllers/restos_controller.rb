class RestosController < ApplicationController
  before_filter :authenticate_owner!, except: [:get_restos, :data, :show_resto]
  before_action :set_resto, except: [:get_restos, :show]

  def get_restos
    if !params[:lat].blank? && !params[:lng].blank?
      location = params[:lat], params[:lng]
      #revisar cuando esten muchos restaurantes disponibles , restringir la busqueda por cercania
      @restos = Resto.where(online: true)
      @restos.each do |resto|
        resto.calculate_distance(location)
      end
      sorted_restos = @restos.sort_by{|e| e.distance}
      @restos = sorted_restos.paginate(:page => params[:page],:per_page => params[:per_page])
      render json: @restos, each_serializer: ApiRestoSerializer, root: false
    else
      restos = Resto.where(online: true)
      @restos = restos.paginate(:page => params[:page], :per_page => params[:per_page])
      render json: @restos, each_serializer: ApiRestoSerializer, root: false
    end
  end

  def show_resto
    location = params[:lat], params[:lng]
    @resto.calculate_distance(location)
    render json: @resto,  root: false
  end

  def publish_resto
    @resto = current_owner.resto
    if not @resto.past_due?
      @resto.update(online: true)
      redirect_to :back
    else
      redirect_to :back
      flash["error"] = "Ups hubo un error"
    end
  end

  def unpublish_resto
    @resto = current_owner.resto
    if not @resto.past_due?
      @resto.update(online: false)
      redirect_to :back
    else
      redirect_to :back
      flash["error"] = "Ups hubo un error"
    end
  end

  def data
    resto_params = [:direccion,:telefono,:lat,:lng,:hasReservas,:hasParking,:hasTickets,:hasWifi,:has_delivery,:horario]
    return render json:{ resto: @resto.as_json(only: resto_params),menus: @resto.menus.as_json(:methods => [:image_url]), promos: @resto.promos.as_json(:methods => [:image_url]) }
  end

  def update
    if @resto.update(resto_params)
      flash[:notice] = "Cambio realizados exitosamente"
      redirect_to resto_path(@resto)
    else
      flash[:alert] = "Debes rellenar todos los campos."
      redirect_to :back
    end
  end

  def show
    @resto = current_owner.resto
    @past_due = current_owner.resto.past_due?
  end

  private
    def set_resto
      @resto = Resto.find(params[:id])
    end

    def resto_params
        params.require(:resto).permit(:name,:details,
                                      :direccion,:horario,
                                      :tipo,:telefono,:hasWifi,
                                      :hasFumadores,:hasParking,
                                      :hasTickets,:hasMenu,
                                      :hasReservas,:hasDelivery,:avatar,:resto_tipo_id)
    end

end
