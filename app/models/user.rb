class User < ActiveRecord::Base
  has_many :dish_posts
  has_many :restaurants, through: :dish_posts
end
