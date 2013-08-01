class ChangeDateTimeInAppointments < ActiveRecord::Migration
  def change
  	change_column :appointments, :day, :string
  	change_column :appointments, :requested_time, :string
  end
end
