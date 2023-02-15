class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
  
    private
  
    def after_sign_out_path_for(*)
      new_user_session_path
    end

    def after_sign_up_path_for(*)
      new_user_session_path
    end
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
    end
  end
