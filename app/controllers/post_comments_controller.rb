class PostCommentsController < ApplicationController
  def create
    @post_bungu = PostBungu.find(params[:post_bungu_id])
    @post_comment = @post_bungu.post_comments.new(post_comment_params.merge(user_id: current_user.id))
    @post_comment.save
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content)
  end
end
