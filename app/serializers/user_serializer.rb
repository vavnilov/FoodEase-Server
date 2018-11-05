class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username
  has_many :reviews, through: :restaurants
end
