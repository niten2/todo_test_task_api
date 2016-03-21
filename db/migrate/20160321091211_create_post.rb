class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, index: true
      t.string :body
      t.string :user_id, index: true

      t.timestamps null: false
    end
  end
end
