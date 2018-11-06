class RelationshipsController < ApplicationController
  def create
    
    follower_id = decode_token(params[:user])[0]["id"]
    followed_id = params[:followed_id]
    @relationship = Relationship.create(follower_id: follower_id, followed_id: followed_id)
    render json: @relationship, status: :accepted
  end
end
