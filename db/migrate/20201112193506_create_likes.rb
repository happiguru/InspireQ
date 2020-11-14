class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :quote_id
      t.integer :user_id
    end
    add_foreign_key :likes, :users, column: :user_id
    add_foreign_key :likes, :quotes, column: :quote_id
  end
end
