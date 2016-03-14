class RestosApiController < ApplicationController
  before_filter :restrict_access
  def show_resto
    @resto = Resto.cached_find(params[:id])
    render json: @resto
  end

  def menus
    @menus = Menu.where(resto_id: params[:id])
    render json: @menus.to_json(:except => [:avatar_content_type,:avatar_file_name,:avatar_file_size,:avatar_updated_at,:created_at,:id,:updated_at],:methods => [:image_url])
  end

  def promos
    @promos = Promo.where(resto_id: params[:id])
    render json: @promos.to_json(:except => [:avatar_content_type,:avatar_file_name,:avatar_file_size,:avatar_updated_at,:created_at,:id,:updated_at],:methods => [:image_url])
  end

  def search
    @results = Resto.search(params[:data])
    location = params[:lat], params[:lng]
    @results.each do |resto|
      resto.calculate_distance(location)
    end
    render json: @results, each_serializer: ApiRestoSerializer, root: false
  end

  private

    # def params_to_json_restos
    #   @restos.to_json(:except => [:admin_id,:avatar_content_type,:avatar_file_name,:avatar_file_size,:avatar_updated_at,:created_at,:updated_at],:methods => [:image_url, :image_url_small,:distance])
    # end

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(access_token: token)
      end
    end

end
