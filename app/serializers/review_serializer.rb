class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id, :restaurant_id, :restaurant

  def restaurant
    self.object.restaurant.name
  end
end
