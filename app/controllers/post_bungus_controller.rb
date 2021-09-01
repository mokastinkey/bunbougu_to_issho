class PostBungusController < ApplicationController

  def index
    @post_bungus = PostBungu.all
  end

  def new
    @post_bungu = PostBungu.new
  end

  def create
    @post_bungu = PostBungu.new(post_bungu_params)
    @post_bungu.user_id = current_user.id
    if @post_bungu.save
      redirect_to post_bungus_path
    else
      @post_bungu = PostBungu.new
      render :new
    end
  end

  def show
  end

  private

  def post_bungu_params
    params.require(:post_bungu).permit(
      :genre_id,
      :catchphrase,
      :thought,
      :bungu_name,
      :manufacturer,
      :other_manufacturer,
      :price,
      :place,
      bungu_images_images: []
    )
  end

end
