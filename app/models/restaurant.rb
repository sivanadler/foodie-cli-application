class Restaurant < ActiveRecord::Base
  has_many :dish_posts
  has_many :users, through: :dish_posts
end
