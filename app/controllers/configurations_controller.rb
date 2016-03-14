class ConfigurationsController < ApplicationController
  before_action :set_resto
  before_filter :authenticate_owner!
  
  def index
    if not @resto.subscriptions.blank?
      @subscriptions = @resto.subscriptions.order(:created_at).where("amount > 0")
      @blank = false
      if @subscriptions.blank?
        @blank = true
      end
      if @resto.subscriptions.where(active: true).blank?
        return @past_due = "Tu subscripcion ha expirado"
      end
      @sub = @resto.subscriptions.where(active: true).first
      @days_left = (@sub.expiration_date - Date.today).to_i
    else
      @error = "Hubo un problema con la subscripción"
      @blank = true
    end
  end

  private
  def set_resto
    @resto = Resto.find(params[:resto_id])
  end
end