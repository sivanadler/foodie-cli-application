class DishPost < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
end
