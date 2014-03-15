class StitchesController < ApplicationController
  # GET /stitches
  # GET /stitches.json
  def index
    @stitches = Stitch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stitches }
    end
  end

  # GET /stitches/1
  # GET /stitches/1.json
  def show
    @stitch = Stitch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stitch }
    end
  end

  # GET /stitches/new
  # GET /stitches/new.json
  def new
    @stitch = Stitch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stitch }
    end
  end

  # GET /stitches/1/edit
  def edit
    @stitch = Stitch.find(params[:id])
  end

  # POST /stitches
  # POST /stitches.json
  def create
    @stitch = Stitch.new(params[:stitch])

    respond_to do |format|
      if @stitch.save
        format.html { redirect_to @stitch, notice: 'Stitch was successfully created.' }
        format.json { render json: @stitch, status: :created, location: @stitch }
      else
        format.html { render action: "new" }
        format.json { render json: @stitch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stitches/1
  # PUT /stitches/1.json
  def update
    @stitch = Stitch.find(params[:id])

    respond_to do |format|
      if @stitch.update_attributes(params[:stitch])
        format.html { redirect_to @stitch, notice: 'Stitch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stitch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stitches/1
  # DELETE /stitches/1.json
  def destroy
    @stitch = Stitch.find(params[:id])
    @stitch.destroy

    respond_to do |format|
      format.html { redirect_to stitches_url }
      format.json { head :no_content }
    end
  end
end
