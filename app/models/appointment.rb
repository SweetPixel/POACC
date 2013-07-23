class Appointment < ActiveRecord::Base
	belongs_to :patient
	attr_accessible :day,:requested_time, :patient_id
end
