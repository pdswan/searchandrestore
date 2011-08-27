class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin!
    authenticate_user!

    raise CanCan::AccessDenied.new('You do not have permision to access that resource.') unless current_user.has_role?(:admin)
  end

  rescue_from CanCan::AccessDenied do |exception|
    if signed_in?
      redirect_to root_url, :alert => exception.message
    else
      redirect_to new_user_session_path, :alert => exception.message
    end
  end
end
