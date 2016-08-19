class AddUserIdToFotos < ActiveRecord::Migration[5.0]
  def change
    add_column :fotos, :user_id, :integer
    add_index :fotos, :user_id
  end
end
