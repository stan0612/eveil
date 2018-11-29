class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    @order.buyer = current_user
    if @order.save
      redirect_to orders_path
    else
      @product = @order.product
      render 'products/show'
    end
  end

  def pay
    @order = Order.find(params[:id])
    @order.paid = true
    @order.save
    redirect_to add_reviews_path
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :quantity)
  end
end
