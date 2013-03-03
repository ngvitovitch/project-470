class ApplicationController < ActionController::Base
  protect_from_forgery


  private

  def login user
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def current_dwelling
    @current_dwelling ||= current_user.dwelling if current_user
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def logged_in?
    unless current_user
      redirect_to login_path, notice: 'You must be logged in to do that.'
    end
  end

  helper_method :current_user
  helper_method :current_dwelling
end
