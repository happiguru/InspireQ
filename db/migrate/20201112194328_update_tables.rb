class UpdateTables < ActiveRecord::Migration[6.0]
  def change
    rename_column :quotes, :user_id, :author_id
    rename_column :users, :name, :fullname
    add_column :users, :photo, :string
    add_column :users, :coverimage, :string
  end
end
