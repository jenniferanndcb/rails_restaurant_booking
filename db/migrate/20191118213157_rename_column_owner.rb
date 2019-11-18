class RenameColumnOwner < ActiveRecord::Migration[6.0]
  def change
    rename_column :restaurants, :owner, :user_id
  end
end
