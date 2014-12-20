class AddMediaIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :media_page_id, :integer
    add_column :media_pages, :user_id, :integer
  end
end
