class RemoveColumnOpeningHrsFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :opening_hrs 
  end
end
