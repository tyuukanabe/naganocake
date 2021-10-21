class Public::GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @genre_items = @genre.items.page(params[:page]).reverse_order
  end
end
