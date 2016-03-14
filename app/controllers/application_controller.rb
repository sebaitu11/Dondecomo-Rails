class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
  before_action :set_current_admin

  def after_sign_in_path_for(resource)
    if resource.is_a?(Owner)
      resto_path(resource.resto.id)
    elsif resource.is_a?(AdminUser) 
      admin_dashboard_path(resource)
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin_user
      return admin_root_path
    end
    new_owner_session_path
  end

  protected

  def set_current_admin
    @current_admin = current_owner if current_owner
  end
end
