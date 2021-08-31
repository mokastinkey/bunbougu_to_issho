class PostBungusController < ApplicationController
  
  def index
    @post_bungus = PostBungu.all
  end
  
  def show
  end
  
end
