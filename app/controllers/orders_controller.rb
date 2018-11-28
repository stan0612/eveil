class OrdersController < ApplicationController
  def index
    @orders = Orders.all
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(order_params)
    @order.product = @product
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:quantity, :paid)

end
