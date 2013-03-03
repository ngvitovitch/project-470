class InvitesController < ApplicationController
  # GET /invites
  def index
    @dwelling = Dwelling.find(params[:dwelling_id])

    respond_to do |format|
      format.html # index.html.haml
    end
  end

  # GET /invites/new
  def new
    @invite = Invite.new(dwelling_id: params[:dwelling_id])

    respond_to do |format|
      format.html # new.html.haml
    end
  end

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
      @dwelling = @invite.dwelling
      current_user.dwelling = @dwelling
    end
    respond_to do |format|
      format.html { redirect_to 404 } unless @invite
      if current_user.save
        format.html { redirect_to root_path }
      else
        format.html { render action: 'show' }
      end
    end
  end

  # POST /invites
  def create
    params[:invite][:dwelling_id] = params[:dwelling_id]
    @invite = Invite.new(params[:invite])
    if @invite.save
      InviteMailer.invite(@invite, invites_url(@invite.token)).deliver
    end

    respond_to do |format|
      if @invite.save
        format.html { redirect_to dwelling_roomates_path(@invite.dwelling_id), notice: 'Invite was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # DELETE /invites/1
  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy

    respond_to do |format|
      format.html { redirect_to dwelling_roomates_path @invite.dwelling_id}
    end
  end
end
