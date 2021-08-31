class PostBungusController < ApplicationController

  def index
    @post_bungus = PostBungu.all
  end

  def new
    @post_bungu = PostBungu.new
  end

  def show
  end

  private

  def post_bungu_params
    params.require(:post_bungu).permit(
      :catchphrase,
      :bungu_images_images,
      :thought,
      :manufacturer,
      :price,
      :place
    )
  end

end
