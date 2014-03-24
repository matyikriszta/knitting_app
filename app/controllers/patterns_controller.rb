class PatternsController < ApplicationController
  before_filter :authenticate_user!
  # GET /patterns
  # GET /patterns.json
  def index
    @patterns = Pattern.all
    @q = Pattern.search(params[:q])
    @patterns = @q.result(distinct: true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patterns }
    end
  end

  def latest
    @patterns = Pattern.order("created_at DESC").all
  end

  def popular
    @patterns = Pattern.order("cached_votes_total DESC").all
  end

  def ladies
    @patterns = Pattern.where(category_id: 37)
  end

  def gents
    @patterns = Pattern.where(category_id: 38)
  end

  def kids
    @patterns = Pattern.where(category_id: 39)
  end

  def holiday
    @patterns = Pattern.where(category_id: 41)
  end

  # GET /patterns/1
  # GET /patterns/1.json
  def show
    @pattern = Pattern.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pattern }
    end
  end

  # GET /patterns/new
  # GET /patterns/new.json
  def new
    @pattern = Pattern.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pattern }
    end
  end

  # GET /patterns/1/edit
  def edit
    @pattern = Pattern.find(params[:id])
  end

  # POST /patterns
  # POST /patterns.json
  def create
    @pattern = Pattern.new(params[:pattern])
    @pattern.user = current_user
    @pattern.no_of_rows.to_i.times do
      @row = @pattern.rows.build
      @pattern.no_of_stitches.to_i.times do
        @row.stitches.build
      end
    end

    respond_to do |format|
      if @pattern.save
        format.html { redirect_to edit_pattern_path(@pattern), notice: 'Pattern was successfully created.' }
        format.json { render json: @pattern, status: :created, location: @pattern }
      else
        format.html { render action: "new" }
        format.json { render json: @pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patterns/1
  # PUT /patterns/1.json
  def update
    @pattern = Pattern.find(params[:id])

    respond_to do |format|
      if @pattern.update_attributes(params[:pattern])
        format.html { redirect_to @pattern, notice: 'Pattern was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patterns/1
  # DELETE /patterns/1.json
  def destroy
    @pattern = Pattern.find(params[:id])
    @pattern.destroy

    respond_to do |format|
      format.html { redirect_to patterns_url }
      format.json { head :no_content }
    end
  end

  def like_show
    @pattern = Pattern.find(params[:id])
    @pattern.liked_by current_user unless current_user.id == @pattern.user_id
    redirect_to @pattern
  end

  def unlike_show
    @pattern = Pattern.find(params[:id])
    @pattern.downvote_from current_user
    redirect_to @pattern
  end

  def like_index
    @pattern = Pattern.find(params[:id])
    @pattern.liked_by current_user unless current_user.id == @pattern.user_id
    redirect_to patterns_path
  end

  def unlike_index
    @pattern = Pattern.find(params[:id])
    @pattern.downvote_from current_user
    redirect_to patterns_path
  end

end
