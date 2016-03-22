class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, index: true
      t.string :user_id, index: true
      t.string :author
      t.datetime :published_at, index: true

      t.timestamps null: false
    end
  end
end
