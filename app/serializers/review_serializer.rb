class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id, :user, :restaurant_id, :restaurant, :location, :cost_for_two, :cuisines, :image, :price_range, :created_at
  # belongs_to :user
  def restaurant
    self.object.restaurant.name
  end

  def location
    self.object.restaurant.location
  end

  def cost_for_two
    self.object.restaurant.cost_for_two
  end

  def cuisines
    self.object.restaurant.cuisines
  end

  def image
    self.object.restaurant.image
  end

  def price_range
    self.object.restaurant.price_range
  end

  def user
    self.object.user.name
  end
end
