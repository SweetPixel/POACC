class AddApprovedToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :approved, :boolean
  end
end
