class RemoveColumnRatingsFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :ratings 
  end
end
