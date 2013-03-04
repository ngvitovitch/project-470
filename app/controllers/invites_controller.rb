class InvitesController < ApplicationController
  before_filter :logged_in?, :except => :show
  # GET /invites/show
  def show
    @invite = Invite.find_by_token(params[:token])
    if @invite
      @dwelling = @invite.dwelling
    end

    respond_to do |format|
      format.html # show.html.haml
    end
  end

  # GET /invites/:token/accept
  def accept
    @invite = Invite.find_by_token(params[:token])
    if @invite
      current_user.dwelling = @invite.dwelling
      current_user.save
    end
    @invite.destroy
    respond_to do |format|
      format.html { redirect_to 404 } unless @invite
      if current_user.save
        format.html { redirect_to root_path }
      else
        format.html { render action: 'show' }
      end
    end
  end
end
