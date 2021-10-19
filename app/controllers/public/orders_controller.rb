class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      # カートアイテムをオーダーアイテムに１商品ずつ移す
      cart_items.each do |cart|
        order_item = OderItem.new
        order_item.order_id = @order.id
        order_item.item_id = cart.item_id
        order_item.quantity = cart.auantity
        order_item.purchase_price = cart.item.add_tax_price
        # オーダーアイテムに保存
        order_item.save
      end
      redirect_to 'public/orders/confirm'
      # カートを空にする
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def show
  end

  def confirm
    @cart_items = CartItem.where(customer_id: @customer.id)
    # 全ての商品の税込価格×個数の合計
    @total_price = (@cart_items.map { |cart_item| cart_item.item.add_tax_price * cart_item.quantity }.sum ).floor
  end

  def thanks
  end

  def index
    @orders = Order.all
  end

  def order_params
    params.require(:order).permit(:address_name, :address, :total_price)
  end


end
