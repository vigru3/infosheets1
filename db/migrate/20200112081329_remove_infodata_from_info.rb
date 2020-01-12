class RemoveInfodataFromInfo < ActiveRecord::Migration[6.0]
  def change
    remove_column :infos, :infodata
  end
end
