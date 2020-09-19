class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

       def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
          devise_parameter_sanitizer.permit(:account_update) {
               |u| u.permit(
                            :first_name,
                            :last_name,
                            :avatar,
                            :email,
                            :password,
                            :current_password
                           )
            }
       end

       def page_not_found
          respond_to do |format|
            format.html { render template: 'errors/not_found_error', layout: 'layouts/application', status: 404 }
            format.all  { render nothing: true, status: 404 }
          end
        end

        def server_error
          respond_to do |format|
            format.html { render template: 'errors/internal_server_error', layout: 'layouts/error', status: 500 }
            format.all  { render nothing: true, status: 500}
          end
        end
end
