class OwnersController < Devise::RegistrationsController
  layout "login_layout" , :only => [:confirmation_message]

  def new
    super
  end

  def create
    super do
      if resource.save
        resto = Resto.new(name: resource.resto_name,online: false,owner_id: resource.id)
        resto.save(validate: false)
        Subscription.subscribe(resto,"free",0)
      end
    end
  end

  def update
    super
  end

  #pagina de cuenta creada exitosamente
  def confirmation_message
  end

  # protected

  #   def after_inactive_sign_up_path_for(resource)
  #     admins_conf_message_path
  #   end

  private
    def sign_up_params
      params.require(:owner).permit(:name, :resto_name, :email, :password)
    end
end
