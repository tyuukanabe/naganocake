class Admin::OrdersController < ApplicationController

    def index
        @orders = Order.page(params[:page]).per(10).order(created_at: 'DESC')
        # .order(created_at: 'DESC')降順に並び替え
    end

    def show
        @order = Order.find(params[:id])
        @order_items = OrderItem.all
    end

    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
         if  @order.order_status == "check"
             @order.order_items.update_all(sales_order_status: OrderItem.sales_order_statuses[:wait])
         end
        redirect_to admin_order_path(@order)
    end

    private
    def order_params
        params.require(:order).permit(:customer_id, :freight, :payment_method, :ship_post_code, :ship_to_address, :ship_name, :total_due, :order_status)
    end
end