class ReviewsController < ApplicationController
  def add_reviews
    @reviews = []
    not_reviewed_orders = current_user.orders.where(paid: true).select{ |order| order.review.nil? }
    not_reviewed_orders.each do |not_reviewed_order|
      new_review = Review.new
      new_review.order = not_reviewed_order
      @reviews << new_review
    end
  end

  def create
    @review = Review.new(review_params)
    @product = @review.order.product
    if @review.save
      redirect_to product_path(@product)
    else
      render 'add_reviews'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :order_id)
  end
end
