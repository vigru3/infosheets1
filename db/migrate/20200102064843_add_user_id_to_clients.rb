class AddUserIdToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :user_id, :integer
  end
end
