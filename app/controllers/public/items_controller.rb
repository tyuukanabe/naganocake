class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items = Item.page(params[:page]).reverse_order
    # @items = Item.where(genre_id: 100).page(params[:page]).reverse_order
  end

  def show
    @item =Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

end
