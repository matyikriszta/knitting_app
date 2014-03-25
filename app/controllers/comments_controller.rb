class CommentsController < ApplicationController

  def create
    @pattern = Pattern.find(params[:pattern_id])
    @comment = Comment.build_from(@pattern, current_user.id, params[:comment][:body])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @pattern, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @pattern }
      format.json { head :no_content }
    end
  end

end