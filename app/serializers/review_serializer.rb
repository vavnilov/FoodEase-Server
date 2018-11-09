class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id, :restaurant_id, :restaurant, :user, :created_at
  # belongs_to :user
  def restaurant
    self.object.restaurant.name
  end

  def user
    self.object.user.name
  end
end
