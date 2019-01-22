class CreateDishPostTable < ActiveRecord::Migration[5.0]
  def change
    create_table :dish_posts do |t|
      t.string :name
      t.integer :rating
      t.integer :restaurant_id
      t.integer :user_id
    end
  end
  
end
