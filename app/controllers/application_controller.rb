class ApplicationController < ActionController::Base
  protect_from_forgery
  # convert times from utc to the odwelling's timezone
  before_filter :get_dwelling_time_zone 

  private

  def get_dwelling_time_zone
    Time.zone = current_dwelling.time_zone if current_dwelling
  end

  # Creates a session for a users
  def login user
    session[:user_id] = user.id
  end

  # Destroys the users session
  def logout
    session[:user_id] = nil
  end

  # Returns the user set in the session, multiple calls to this in one
  # response cycle will only use one database call
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  # Returns the dwelling of the user set in the session, multiple calls to 
  # this in one response cycle will only use one database call
  def current_dwelling
    @current_dwelling ||= current_user.dwelling if current_user
  end


  # Redirect to 404 page
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end


  protected
  # Redirect a user to the login page when they attempt to access member 
  # only areas 
  # TODO: after the user logs in they should be directed to the site they 
  # requested
  def logged_in?
    unless current_user
      redirect_to login_path, notice: 'You must be logged in to do that.'
    end
  end

  # Redirect a user to 404 if they are not a member of the dwelling they 
  # are accessing
  def dwelling_member?(dwelling_id)
    unless current_user.dwelling_id == dwelling_id.to_i
      not_found
    end
  end

  # Redirect a user to 404 if they are not the owner of the dwelling they 
  # are accessing
  def dwelling_owner?(dwelling_id)
    unless ( current_user.owned_dwelling &&
            current_user.owned_dwelling.id == dwelling_id.to_i )
      not_found
    end
  end

  # Helper methods are accessable to views
  helper_method :current_user
  helper_method :current_dwelling
end
