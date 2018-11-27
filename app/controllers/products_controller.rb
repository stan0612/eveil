class ProductsController < ApplicationController

  def product_params
    params.require(:product).permit(:title, :description, :price, :initial_stock, :category, :image)
  end
end
