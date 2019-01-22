class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :fav_food
      t.string :fav_cuisine
    end
  end


end#end of class
