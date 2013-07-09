class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.string :name
      t.string :location
      t.string :description
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
