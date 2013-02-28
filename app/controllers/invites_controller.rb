class InvitesController < ApplicationController
  # GET /invites
  def index
    @dwelling = Dwelling.find(params[:dwelling_id])
    @invites = @dwelling.invites

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /invites/1
  def show
    @invite = Invite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /invites/new
  def new
    @invite = Invite.new(dwelling_id: params[:dwelling_id])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /invites/1/edit
  def edit
    @invite = Invite.find(params[:id])
  end

  # POST /invites
  def create
    params[:invite][:dwelling_id] = params[:dwelling_id]
    @invite = Invite.new(params[:invite])

    respond_to do |format|
      if @invite.save
        format.html { redirect_to [@invite.dwelling, @invite], notice: 'Invite was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /invites/1
  def update
    @invite = Invite.find(params[:id])

    respond_to do |format|
      if @invite.update_attributes(params[:invite])
        format.html { redirect_to @invite, notice: 'Invite was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /invites/1
  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy

    respond_to do |format|
      format.html { redirect_to dwelling_invites_url @invite.dwelling_id}
    end
  end
end
