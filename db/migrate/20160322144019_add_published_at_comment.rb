class AddPublishedAtComment < ActiveRecord::Migration
  def change
    add_column :comments, :published_at, :datetime, index: true
  end
end
