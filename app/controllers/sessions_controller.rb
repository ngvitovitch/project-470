# Controller handles creating and destoying user sessions
class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      login user
      redirect_to root_path, :notice => 'Logged in!'
    else
      flash.now.alert = 'Invalid email or password.'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => 'Logged out!'
  end
end
