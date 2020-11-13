class UpdateRepliesTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :replies, :tweet_id, :quote_id
  end
end
