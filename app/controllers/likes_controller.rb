class LikesController < ApplicationController
  def create
    # @post = PostBungu.find(params[:id])
    Like.create(user_id: current_user.id, post_bungu_id: params[:id])
    @post_bungu = PostBungu.find(params[:id])
    # current_user.like(@post_bungu)
    # redirect_to post_bungus_path
  end

  def destroy
    # @post_bungu = Like.find(params[:id]).post_bungu
    Like.find_by(user_id: current_user.id, post_bungu_id: params[:id]).destroy
    @post_bungu = PostBungu.find(params[:id])
    # @post_bungu = Like.find(params[:id]).post_bungu
    # current_user.unlike(@post_bungu)
    # redirect_to post_bungus_path
  end
end