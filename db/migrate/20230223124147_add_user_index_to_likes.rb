class AddUserIndexToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :user, :string
    add_index :likes, :user
  end
end
