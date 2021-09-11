class PostBungusController < ApplicationController
  # url直打ち防止
  before_action :correct_user, only: [:edit, :update]

  def index

    # @post_bungu = PostBungu.new
    @selection = params[:key]
    if not @selection
      @post_bungus = PostBungu.all
    else
      @post_bungus = PostBungu.sort(@selection)
    end
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
    @post_bungu = PostBungu.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post_bungu.post_comments.order(created_at: :desc)
  end

  def edit
    @post_bungu = PostBungu.find(params[:id])
  end

  def update
    @post_bungu = PostBungu.find(params[:id])
    @post_bungu.user_id = current_user.id
    if @post_bungu.update(post_bungu_params)
      redirect_to post_bungu_path(@post_bungu)
    else
      render :edit
    end
  end

  def destroy
    post_bungu = PostBungu.find(params[:id])
    post_bungu.destroy
    redirect_to post_bungus_path
  end

  def search
    # @selection = params[:key]
    # @post_bungus = PostBungu.sort(@selection)
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
      :rate,
      bungu_images_images: []
    )
  end

  def correct_user
    post_bungu = PostBungu.find(params[:id])
    if current_user.id != post_bungu.user_id
      redirect_to post_bungus_path
    end
  end

end
