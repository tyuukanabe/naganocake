class Admin::OrderItemsController < ApplicationController

    def update
        @order = Order.find(params[:order_id])
        @order_item = OrderItem.find(params[:id])
        @order_item.update(order_item_params)
         if  @order_item.sales_order_status == "making"
             @order.update(order_status: "making" )
         elsif @order.order_items.where(sales_order_status: "done").count == @order.order_items.count
             @order.update(order_status: "prepare")
         end
        redirect_to admin_order_path(@order_item.order)
    end

    private
    def order_item_params
        params.require(:order_item).permit(:order_id, :item_id, :quantity, :purchase_price, :sales_order_status)
    end
end
