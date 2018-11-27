class ProductsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
  def product_params
    params.require(:product).permit(:title, :description, :price, :initial_stock, :category, :image)
  end
end
