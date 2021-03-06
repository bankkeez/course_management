class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  include Pundit

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :citizen_id, :student_id, :instructor_id, :department_name, :login, :role])
    end

    def user_not_authorized
      redirect_to(request.referrer || root_path)
    end

end
