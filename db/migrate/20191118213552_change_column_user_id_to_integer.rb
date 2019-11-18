class ChangeColumnUserIdToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :restaurants, :user_id, :integer 
  end
end
