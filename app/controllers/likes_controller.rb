class LikesController < ApplicationController
  def index
    @post_bungus = current_user.like_post_bungus
    @user = current_user
  end

  def create
    Like.create(user_id: current_user.id, post_bungu_id: params[:id])
    @post_bungu = PostBungu.find(params[:id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, post_bungu_id: params[:id]).destroy
    @post_bungu = PostBungu.find(params[:id])
  end
end
