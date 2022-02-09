class AddUserIdToJrbooks < ActiveRecord::Migration[6.1]
  def change
    add_column :jrbooks, :user_id, :integer
    add_index :jrbooks, :user_id
  end
end
