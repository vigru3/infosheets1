class CreateInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :infos do |t|
      t.string :infoname
      t.text :infodata
      t.integer :section_id
      t.timestamps
    end
  end
end
