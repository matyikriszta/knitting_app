class PatternsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
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
    @patterns = Category.find_by_name('ladies').patterns
  end

  def gents
    @patterns = Category.find_by_name('men').patterns
  end

  def kids
    @patterns = Category.find_by_name('children').patterns
  end

  def holiday
    @patterns = Category.find_by_name('holiday').patterns
  end

  # GET /patterns/1
  # GET /patterns/1.json
  def show
    @pattern = Pattern.find(params[:id])
    @comments = @pattern.comment_threads
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
    pattern = Pattern.create(params[:pattern])
    ActiveRecord::Base.transaction do
    6.times do
      Color.create!(pattern_id: pattern.id)
    end
    pattern.user = current_user
    pattern.no_of_rows.to_i.times do
      row = Row.create!(pattern_id: pattern.id)
      pattern.no_of_stitches.to_i.times do
        Stitch.create!(row_id: row.id)
      end
    end
    end

    respond_to do |format|
        if pattern.save
          format.html { redirect_to edit_pattern_path(pattern), notice: 'Pattern was successfully created.' }
          format.json { render json: pattern, status: :created, location: pattern }
        else
          format.html { render action: "new" }
          format.json { render json: pattern.errors, status: :unprocessable_entity }
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

  def voted_for
    @pattern = Pattern.find(params[:id])
    @user.voted_for? @pattern
  end

  # def pdf
  #   format.pdf do
  #     @example_text = "some text"
  #     render :pdf => "pattern_name",
  #            :template => 'patterns/show.pdf.erb',
  #            :layout => 'pdf',
  #            :footer => {
  #               :center => "Center",
  #               :left => "Left",
  #               :right => "Right"
  #            }
  #          end
  # end

  # def download 
  #   html = render_to_string(:action => :show, :layout => "pdf_layout.html") 
  #   pdf = WickedPdf.new.pdf_from_string(html) 
  #   send_data(pdf, 
  #     :filename    => "my_pdf_name.pdf", 
  #     :disposition => 'attachment') 
  # end

end
