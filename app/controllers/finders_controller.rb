class FindersController < ApplicationController
  def finder
    @scope = params[:scope]
    @word = params[:word]

    if @scope == 'User'
      @users = User.nickname_like(@word).page(params[:page]).reverse_order.per(30)
    else
      @post_bungus = PostBungu.bungu_like(@word).page(params[:page]).reverse_order.per(30)
    end
  end
end
