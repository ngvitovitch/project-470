class DwellingsController < ApplicationController
  # GET /dwellings
  def index
    @dwellings = Dwelling.all

    respond_to do |format|
      format.html # index.html.haml
    end
  end

  # GET /dwellings/1
  def show
    @dwelling = Dwelling.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
    end
  end

  #get /dwellings/1/roomates
  def roomates
    @dwelling = Dwelling.find(params[:dwelling_id])

    respond_to do |format|
      format.html #roomates.html.haml
    end
  end

  # GET /dwellings/new
  def new
    @dwelling = Dwelling.new

    respond_to do |format|
      format.html # new.html.haml
    end
  end

  # GET /dwellings/1/edit
  def edit
    @dwelling = Dwelling.find(params[:id])
  end

  # POST /dwellings
  def create
    params[:dwelling][:owner] = current_user
    @dwelling = Dwelling.new(params[:dwelling])
    if @dwelling.save
      current_user.dwelling = @dwelling
      current_user.save
    end
    respond_to do |format|
      if @dwelling.valid?
        format.html { redirect_to root_path, notice: 'Dwelling was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /dwellings/1
  def update
    @dwelling = Dwelling.find(params[:id])

    respond_to do |format|
      if @dwelling.update_attributes(params[:dwelling])
        format.html { redirect_to @dwelling, notice: 'Dwelling was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /dwellings/1
  def destroy
    @dwelling = Dwelling.find(params[:id])
    @dwelling.destroy

    respond_to do |format|
      format.html { redirect_to dwellings_url }
    end
  end
end
