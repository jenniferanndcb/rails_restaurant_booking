class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :restaurants, :location, :city 
  end
end
