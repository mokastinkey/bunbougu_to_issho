class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.order(Arel.sql('RANDOM()'))
  end

  def following
    #自分がフォローしているユーザー一覧
    user  = User.find(params[:id])
    @users = user.following_user.where.not(id: current_user.id)
  end

  def follower
    #@userをフォローしているユーザー
    user = User.find(params[:id])
    @users = user.follower_user.where.not(id: current_user.id)
  end


end
