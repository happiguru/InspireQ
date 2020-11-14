class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.integer :user_id
      t.integer :tweet_id
      t.text :content

      t.timestamps
    end
    add_index :replies, :tweet_id
    add_foreign_key :replies, :users, column: :user_id
  end
end
