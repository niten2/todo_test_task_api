class AddPublishedAtPosts < ActiveRecord::Migration
  def change
    add_column :posts, :published_at, :datetime, index: true
  end
end
