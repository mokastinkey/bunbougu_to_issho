class FindersController < ApplicationController
  def finder
    @scope = params[:scope]
    word = params[:word]

    if @scope == 'User'
      @users = User.looks(word)
    else
      @post_bungus = PostBungu.looks(word)
    end
  end
end
