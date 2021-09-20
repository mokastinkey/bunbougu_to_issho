class GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @post_bungus = @genre.post_bungus
  end
end
