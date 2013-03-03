class DwellingInvitesController < ApplicationController
  before_filter :dwelling_owner?

  # GET /invites/
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

  private

    def dwelling_owner?
      unless ( current_user && current_user.owned_dwelling &&
          current_user.owned_dwelling.id == params[:dwelling_id].to_i )
        not_found
      end
    end
end
