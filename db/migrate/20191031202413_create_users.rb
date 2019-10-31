class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :email
      t.password_digest :password
      t.boolean :admin, default: false 

      t.timestamps 
    end
  end
end
