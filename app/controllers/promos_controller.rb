class PromosController < ApplicationController
  before_action :set_promo, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_owner!

  # GET /promos
  # GET /promos.json
  def index
    @promos = Promo.where(resto_id: current_owner.resto.id)
  end

  # GET /promos/1
  # GET /promos/1.json
  def show
  end

  # GET /promos/new
  def new
    @promo = Promo.new
  end

  # GET /promos/1/edit
  def edit
  end

  # POST /promos
  # POST /promos.json
  def create
    @promo = Promo.new(promo_params)
    @promo.resto_id = current_owner.resto.id

    respond_to do |format|
      if @promo.save
        format.html { redirect_to resto_promos_url, notice: 'Promoción Creada Exitosamente' }
        format.json { render :show, status: :created, location: @promo }
      else
        format.html { render :new }
        format.json { render json: @promo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promos/1
  # PATCH/PUT /promos/1.json
  def update
    respond_to do |format|
      if @promo.update(promo_params)
        format.html { redirect_to resto_promos_url, notice: 'Promoción Actualizada Exitosamente.' }
        format.json { render :show, status: :ok, location: @promo }
      else
        format.html { render :edit }
        format.json { render json: @promo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promos/1
  # DELETE /promos/1.json
  def destroy
    @promo.destroy
    respond_to do |format|
      format.html { redirect_to resto_promos_url, notice: 'Promoción Eliminada Exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promo
      @promo = Promo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promo_params
      params.require(:promo).permit(:name,:description,:price,:discount,:avatar)
    end
end
