class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :day
      t.time :requested_time
      t.integer :patient_id

      t.timestamps
    end
  end
end
