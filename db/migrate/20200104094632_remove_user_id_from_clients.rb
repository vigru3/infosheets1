class RemoveUserIdFromClients < ActiveRecord::Migration[6.0]
  def change
    remove_column :clients, :user_id
  end
end
