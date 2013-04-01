# This controller might not stay around. For now it serves as a homepage 
# for users/dwellings
class DashboardController < ApplicationController

  # This is the root path in the application
  # Logged in users will see their dashboard, 
  # people who arn't logged in will see a blurb on
  # Roomie, and be prompted to signup or login.
  # this probably isn't the cleanest way to do this
  def index
    if current_user
      if current_dwelling
        # Show the users dashboard
        render :dashboard 
      else
        # The user is logged in, but not a member of a 
        # dwelling, prompt them to join a dwelling
        render :join_dwelling
      end
    else
      # The user is not logged in, tell them about the 
      # application, and ask them to signup, or login
      @user = User.new
      render :signup
    end
  end
end
