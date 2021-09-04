class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def following
    #自分がフォローしているユーザー一覧
    @user  = User.find(params[:user_id])
    @followings = @user.following_user.where.not(id: current_user.id)
  end

  def followers
    #@userをフォローしているユーザー
    @user = User.find(params[:user_id])
    @followers = @user.follower_user.where.not(id: current_user.id)
  end


end
