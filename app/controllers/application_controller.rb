class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    alert_message = case
    when current_user
      "You are not authorized to access this page"
    else
      "You need to login as a registered user to access this page"
    end
    redirect_to new_user_path, alert: alert_message
  end

  protected
    def after_sign_in_path_for(resource)
      patterns_path
    end
end
