class AddUserIdToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_column :quotes, :user_id, :integer
  end
end
