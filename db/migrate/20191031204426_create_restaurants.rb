class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.string :website
      t.string :phone_number
      t.string :opening_hrs
      t.integer :ratings
      t.integer :capacity
    end
  end
end
