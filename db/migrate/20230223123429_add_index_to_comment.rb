class AddIndexToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :user, :string
    add_index :comments, :user
  end
end
