class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    render json: @reviews
  end

  def create
    if params[:image] == ''
      image = 'https://www.sunset.com/wp-content/uploads/e3fa7d1e703dab48169dbe4f815a1745-1200x600-c-default.jpg'
    else
      image = params[:image]
    end
    @restaurant = Restaurant.find_or_create_by(id: params[:restaurant].to_i, name: params[:restaurant_name], location: params[:location], cost_for_two: params[:cost_for_two], cuisines: params[:cuisines], image: image, price_range: params[:price_range])
    @review = Review.new(user_id: params[:current_user]["id"], restaurant_id: @restaurant.id, body: params[:body] )

    if @review.save
      render json: @review, status: :accepted
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessible_entity
    end
  end
end
