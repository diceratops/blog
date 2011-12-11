class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
				format.html { redirect_to @comment.post, notice: 'Failed to create comment.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
	
		respond_to do |format|
			format.html { redirect_to @comment.post, notice: 'Comment was successfully deleted.' }
		end
	end

end
