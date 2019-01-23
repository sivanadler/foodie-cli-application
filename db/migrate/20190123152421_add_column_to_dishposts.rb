class AddColumnToDishposts < ActiveRecord::Migration[5.0]
  def change
    add_column :dish_posts, :meal_description, :string
  end
end
