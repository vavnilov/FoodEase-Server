class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    render json: @reviews
  end

  def create
    # byebug
    @restaurant = Restaurant.find_or_create_by(id: params[:restaurant].to_i, name: params[:restaurant_name])
    @review = Review.new(user_id: 1, restaurant_id: @restaurant.id, body: params[:body])
    if @review.save
      render json: @review, status: :accepted
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessible_entity
    end
  end
end