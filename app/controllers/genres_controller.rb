class GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @post_bungus = @genre.post_bungus.order(created_at: "desc")
  end
end
