class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @post, notice: "Comment was successfully created." }
      end
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
