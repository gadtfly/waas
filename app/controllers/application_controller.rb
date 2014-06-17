class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: exception.message
  end

  protected

  def after_sign_in_path_for(resource)
    user_path(@user)
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
  
end
