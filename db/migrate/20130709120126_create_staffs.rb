class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :qualification
      t.string :biography
      t.string :picture

      t.timestamps
    end
  end
end
