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
      redirect_to orders_confirm_path
      # カートを空にする
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end


  def confirm
    @order = Order.new(order_params)

    # 郵送先をif文で確認
    if params[:order][:address_number] == "1"
      @order.name = current_customer.full_name
      @order.address = current_customer.customer_address
    elsif params[:order][:address_number] == "2"
      if Address.exists?(name: params[:order][:registered]).name
        @order.name = Address.find(params[:order][:registered]).address
      else
        render :new
      end
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      else
        render :new
      end
    else
      redirect_to addresses_path
    end


    @cart_items = CartItem.where(customer_id: @customer.id)
    # 全ての商品の税込価格×個数の合計
    @total_price = (@cart_items.map { |cart_item| cart_item.item.add_tax_price * cart_item.quantity }.sum ).floor
  end

  def show
  end

  def complete
  end

  def index
    @orders = Order.all
  end

  private

  def order_params
    params.require(:order).permit(:item_name, :address, :total_price)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end


end
