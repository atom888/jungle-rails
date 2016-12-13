class ReviewsController < ApplicationController

  before_action :authorize



  def create
    product = Product.find(params[:product_id])
    review = product.reviews.create(review_params)
    review.user = current_user

    if review.save
      puts "I saved"
      redirect_to product_path(product)
    else
      puts "save failed"
      redirect_to '/'
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to product_path(params[:product_id])
  end

  private
  def review_params
    params.require(:review).permit(:description, :rating)
  end

  def require_login
    if !current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to product_path(params[:product_id])
    end
  end

end

