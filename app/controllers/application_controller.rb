class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :store_location_if_html, :only => [:index, :show]

  rescue_from CanCan::AccessDenied do |exception|
    if current_user.present?
      redirect_to root_path, alert: exception.message, status: 401
    else
      redirect_to new_user_session_path, alert: "Please, sign in!"
    end
  end

  def after_sign_in_path_for(resource)
    flash.now[:notice] = "Welcome back #{resource.name}!"
    return user_path(resource)
  end

  def store_location_if_html
    store_location if ['text/html', 'application/javascript', 'text/javascript'].include?(request.format) && !['application/json'].include?(request.format)
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def back
    redirect_back_or_default
  end

  def redirect_back_or_default(default=root_path, options={})
    redirect_to(session[:return_to] || default, options)
    session[:return_to] = nil
  end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
