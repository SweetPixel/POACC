class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.text :Name
      t.integer :Contact
      t.text :Email
      t.text :Address

      t.timestamps
    end
  end
end
