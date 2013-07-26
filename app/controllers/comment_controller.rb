class CommentController < ApplicationController

  def create
    @comment = Comment.new
    @comment.user = User.find(session[:user_id])
    @comment.revision = Revision.find(comment_params[:revision_id])
    @comment.message = comment_params[:message]
    respond_to do |format|
      if @comment.save!
        format.html {render json: @comment}
      else 
        nil
      end
    end
  end

  def comment_params
     params.require(:comment).permit(:revision_id, :message)
  end
end