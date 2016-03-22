class AddAuthorPostComment < ActiveRecord::Migration
  def change
    add_column :posts, :author, :string
    add_column :comments, :author, :string
  end
end
