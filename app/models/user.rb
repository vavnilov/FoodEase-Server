class User < ApplicationRecord
  has_secure_password

  has_many :reviews, dependent: :destroy
  has_many :restaurants, through: :reviews
  # has_many :relationships
  # has_many :followers, :class_name => “Relationship”, :foreign_key => “user_id”
  # has_many :following, :class_name => “Relationship”, :foreign_key => “follower_id”
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :name, presence: true
  validates :name, length: {maximum: 15, message: "Name is too long."}

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: {maximum: 15, message: "User name is too long."}

  def follow(other)
    active_relationships.create(followed_id: other.id)
  end

  def unfollow(other)
    active_relationships.find_by(followed_id: other.id).destroy
  end

  def following?(other)
    following.include?(other)
  end
end
