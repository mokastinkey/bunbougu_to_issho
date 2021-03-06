class PostBungusController < ApplicationController
  # url直打ち防止
  before_action :correct_user, only: [:edit, :update]
  # 文房具詳細画面(show.html)を見るには、ログインしていないといけない。indexとsearchはログインしていなくても見ることが可能
  before_action :authenticate_user!, except: [:index, :search]

  def index
    @post_bungus = PostBungu.limit(9).order("created_at DESC")
    @genres = Genre.all
    # いいねランキング
    @month_like_ranks = PostBungu.most_liked
  end

  def new
    @post_bungu = PostBungu.new
  end

  def create
    @post_bungu = PostBungu.new(post_bungu_params.merge(user_id: current_user.id))
    # @post_bungu.user_id = current_user.id
    if @post_bungu.save
      redirect_to post_bungu_path(@post_bungu)
    else
      render :new
    end
  end

  def show
    @post_bungu = PostBungu.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post_bungu.post_comments.order(created_at: :asc)
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
    redirect_to user_path(current_user)
  end

  def search
    @selection = params[:key]
    if !@selection
      @post_bungus = PostBungu.page(params[:page]).reverse_order.per(30)
    elsif @selection == 'new' || @selection == 'old'
      @post_bungus = PostBungu.sort(@selection).page(params[:page]).per(30)
    else
      post_bungus = PostBungu.sort(@selection)
      @post_bungus = Kaminari.paginate_array(post_bungus).page(params[:page]).per(30)
    end
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
