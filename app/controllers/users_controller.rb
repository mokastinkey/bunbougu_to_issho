class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @post_bungus = @user.post_bungus.order(created_at: :desc)
  end

  def index
    @users = User.where.not(id: current_user).order(Arel.sql('RANDOM()'))
    @user = current_user
  end

  def following
    @user = current_user
    #自分がフォローしているユーザー一覧
    user  = User.find(params[:id])
    @users = user.following_user.where.not(id: current_user.id)
  end

  def follower
    @user = current_user
    #@userをフォローしているユーザー
    user = User.find(params[:id])
    @users = user.follower_user
    # 上の続き where.not(id: current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_edit_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_edit_params
    params.require(:user).permit(:nickname, :profile_image, :self_introduction)
  end

end
