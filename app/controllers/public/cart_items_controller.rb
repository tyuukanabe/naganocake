class Public::CartItemsController < ApplicationController

  def index
    # @customer = current_customer
    # @cart_items = CartItem.all


  end

  def create
    # @cart_item = cart_item.new(cart_item_params)
    # @cart_items = current_customer.cart_items
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
