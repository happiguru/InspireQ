class DeleteForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :replies, :users
    remove_foreign_key :likes, :quotes
    remove_foreign_key :likes, :users

    add_index :replies, :user_id
    add_index :likes, :quote_id
    add_index :likes, :user_id
  end
end
