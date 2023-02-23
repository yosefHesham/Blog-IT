class AddPostIndexToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :post, :string
    add_index :likes, :post
  end
end
