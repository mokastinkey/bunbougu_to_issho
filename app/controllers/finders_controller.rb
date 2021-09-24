class FindersController < ApplicationController
  def finder
    @scope = params[:scope]
    @word = params[:word]

    if @scope == 'User'
      @users = User.looks(@word).page(params[:page]).reverse_order.per(2)
    else
      @post_bungus = PostBungu.looks(@word).page(params[:page]).reverse_order.per(2)
    end
  end
end
