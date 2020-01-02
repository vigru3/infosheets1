class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string :sectionname
      t.integer :client_id
      t.timestamps
    end
  end
end
