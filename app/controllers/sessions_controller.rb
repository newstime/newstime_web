class SessionsController < Devise::SessionsController

  before_filter :store_location, only: [:new, :destroy]

protected

  def store_location
    session[:return_to] = params[:return_to] if params[:return_to]
  end

  def after_sign_in_path_for(resource_or_scope)
    session[:return_to] || super
  end

  alias :after_sign_out_path_for :after_sign_in_path_for

end
