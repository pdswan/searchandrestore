class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    if anybody_signed_in?
      redirect_to root_url, :alert => exception.message
    else
      redirect_to new_user_session_path, :alert => exception.message
    end
  end
end
