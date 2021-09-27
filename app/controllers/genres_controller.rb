class GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @post_bungus = @genre.post_bungus.page(params[:page]).reverse_order.per(30)
  end
end
