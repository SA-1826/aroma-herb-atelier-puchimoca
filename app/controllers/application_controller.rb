class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_authentication

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def configure_authentication
    if admin_controller?
      authenticate_admin!
    else
      authenticate_user! unless action_is_public?
    end
  end

  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end

  def action_is_public?
    (controller_name == 'homes' && action_name.in?(['home', 'about'])) || (controller_name == 'programs' && action_name.in?(['index', 'show'])) || (controller_name == 'inquiries' && action_name.in?(['new', 'create', 'thanks']))
  end
end
