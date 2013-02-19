class DwellingsController < ApplicationController
  # GET /dwellings
  # GET /dwellings.json
  def index
    @dwellings = Dwelling.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dwellings }
    end
  end

  # GET /dwellings/1
  # GET /dwellings/1.json
  def show
    @dwelling = Dwelling.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dwelling }
    end
  end

  # GET /dwellings/new
  # GET /dwellings/new.json
  def new
    @dwelling = Dwelling.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dwelling }
    end
  end

  # GET /dwellings/1/edit
  def edit
    @dwelling = Dwelling.find(params[:id])
  end

  # POST /dwellings
  # POST /dwellings.json
  def create
    @dwelling = Dwelling.new(params[:dwelling])
    if @dwelling.save
      current_user.join_dwelling @dwelling
    end

    respond_to do |format|
      if @dwelling.save
        format.html { redirect_to root_path, notice: 'Dwelling was successfully created.' }
        format.json { render json: @dwelling, status: :created, location: @dwelling }
      else
        format.html { render action: "new" }
        format.json { render json: @dwelling.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dwellings/1
  # PUT /dwellings/1.json
  def update
    @dwelling = Dwelling.find(params[:id])

    respond_to do |format|
      if @dwelling.update_attributes(params[:dwelling])
        format.html { redirect_to @dwelling, notice: 'Dwelling was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dwelling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dwellings/1
  # DELETE /dwellings/1.json
  def destroy
    @dwelling = Dwelling.find(params[:id])
    @dwelling.destroy

    respond_to do |format|
      format.html { redirect_to dwellings_url }
      format.json { head :no_content }
    end
  end
end
