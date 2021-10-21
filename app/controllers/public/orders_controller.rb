class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)

    # @customer = Customer.find(params[:id])
    @cart_items = current_customer.cart_items
    # 全ての商品の税込価格×個数の合計
    @total_price = (@cart_items.map { |cart_item| cart_item.item.add_tax_price * cart_item.quantity }.sum ).floor
    @order.freight = 800
    @order.payment_method = params[:order][:payment_method]
    @order.total_due = @total_price + @order.freight
    # @order.order_status = current_customer.cart_item.order_status


    params[:order][:address_number]
    @order.ship_post_code = current_customer.post_code
    @order.ship_name = current_customer.full_name
    @order.ship_to_address = current_customer.address

    # 郵送先をif文で確認
    # if params[:order][:address_number] == "1"
    #   @order.ship_post_code = current_customer.post_code
    #   @order.ship_name = current_customer.full_name
    #   @order.ship_to_address = current_customer.address
    # elsif params[:order][:address_number] == "2"
    #   if Address.exists?(name: params[:order][:registered])
    #     @order.name = Address.find(params[:order][:registered]).name
    #     @order.address = Address.find(params[:order][:registered]).address
    #   else
    #     render :new
    #   end
    # elsif params[:order][:address_number] == "3"
    #   address_new = current_customer.addresses.new(address_params)
    #   if address_new.save
    #   else
    #     render :new
    #   end
    # else
    #   redirect_to addresses_path
    # end

  end


  def create
    # cart_items = current_customer.cart_items.all
    order = current_customer.orders.new(order_params)
    order.save
    # カートアイテムをオーダーアイテムに１商品ずつ移す
    current_customer.cart_items.each do |cart|
      order_item = order.order_items.new
      order_item.item_id = cart.item_id
      order_item.quantity = cart.quantity
      order_item.purchase_price = cart.item.add_tax_price
      # オーダーアイテムに保存
      order_item.save
    end
    # カートを空にする
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path


  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :ship_post_code, :ship_to_address, :ship_name, :total_due)

  end

  def address_params
    params.require(:order).permit(:ship_name, :ship_to_address, :ship_post_code)
  end


end
