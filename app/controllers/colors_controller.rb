class ColorsController < ApplicationController

  def index
    @colors = Color.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @colors }
    end
  end

  def show
    @color = Color.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @color }
    end
  end

  def edit
    @color = Color.find(params[:id])
  end

  def new
    @color = Color.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @color }
    end
  end

  def create
    @color = Color.new(params[:color])

    respond_to do |format|
      if @color.save
        format.html { redirect_to @color, notice: 'Color was successfully created.' }
        format.json { render json: @color, status: :created, location: @color }
      else
        format.html { render action: "new" }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /colors/1
  # PUT /colors/1.json
  def update
    @color = Color.find(params[:id])

    respond_to do |format|
      if @color.update_attributes(params[:color])
        format.html { redirect_to @color, notice: 'Color was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stitches/1
  # DELETE /stitches/1.json
  def destroy
    @stitch = Color.find(params[:id])
    @stitch.destroy

    respond_to do |format|
      format.html { redirect_to stitches_url }
      format.json { head :no_content }
    end
  end

end