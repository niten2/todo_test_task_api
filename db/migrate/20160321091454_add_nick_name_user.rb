class AddNickNameUser < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string, index: true
  end
end
