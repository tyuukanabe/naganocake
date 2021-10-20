class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @sum = 0
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
    # @cart_items = current_customer.cart_items
    # @cart_item= CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: current_customer.id)
    # if @cart_item.blank?
    #   @cart_item = CartItem.new(cart_item_params)
    # end
    # @cart_item.quantity += params[:cart_item][:quantity].to_i
    # @cart_item.customer_id = current_customer.id
    # @cart_item.save
    # redirect_to cart_items_path
  end

  def update
    @cart_items = current_customer.cart_items
    @cart_item = @cart_items.find_by(item_id: params[:item_id])
    @cart_item.update(quantity: params[:quantity])
     redirect_to cart_items_path
  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_item.destroy
     redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
     redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
  end

end
