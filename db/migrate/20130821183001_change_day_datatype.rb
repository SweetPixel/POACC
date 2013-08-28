class ChangeDayDatatype < ActiveRecord::Migration
	def change
  	# change_column :appointments, :day, :date
  	drop_table :appointments
  	create_table :appointments do |t|
  		t.date :day
  		t.time :requested_time
  		t.integer :patient_id

  		t.timestamps
  	end
  end
end
