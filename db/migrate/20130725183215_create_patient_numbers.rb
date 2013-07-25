class CreatePatientNumbers < ActiveRecord::Migration
  def change
    create_table :patient_numbers do |t|
      t.integer :start
      t.integer :end

      t.timestamps
    end
  end
end
