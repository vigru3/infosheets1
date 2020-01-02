class AddUserIdToSections < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :user_id, :integer
  end
end
