class AddPostIndexToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :posts, :string
    add_index :comments, :posts
  end
end
