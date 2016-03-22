class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, index: true
      t.string :body
      t.string :author
      t.string :user_id, index: true
      t.datetime :published_at, index: true

      t.timestamps null: false
    end
  end
end
