class Admin::GenresController < ApplicationController
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def index
    @newgenres = Genre.new
    @genres = Genre.all
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
