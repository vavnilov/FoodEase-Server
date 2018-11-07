class RelationshipsController < ApplicationController
  def index
    @relationships = Relationship.all
    render json: @relationships
  end

  def create
    follower_id = decode_token(params[:user])[0]["id"]
    followed_id = params[:followed_id]
    @relationship = Relationship.create(follower_id: follower_id, followed_id: followed_id)
    if @relationship.valid?
      render json: @relationship, status: :accepted
    else
      render json: { errors: @relationship.errors.full_messages }, status: :unprocessible_entity
    end
  end
end
