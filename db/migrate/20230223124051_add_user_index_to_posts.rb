class AddUserIndexToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :user, :string
    add_index :posts, :user
  end
end
