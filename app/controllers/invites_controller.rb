class InvitesController < ApplicationController
  # GET /invites
  def index
    @dwelling = Dwelling.find(params[:dwelling_id])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /invites/new
  def new
    @invite = Invite.new(dwelling_id: params[:dwelling_id])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /invites
  def create
    params[:invite][:dwelling_id] = params[:dwelling_id]
    @invite = Invite.new(params[:invite])

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
