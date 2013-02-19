class DashboardController < ApplicationController
  def index
    if current_user
      if current_dwelling
        render :dashboard
      else
        render :join_dwelling
      end
    else
      render :signup
    end
  end
end
