class Appointment < ActiveRecord::Base
	belongs_to :patient
	attr_accessible :day, :requested_time,:approved, :patient_id
	before_save :check_if_approved
	after_save :notify_clinic


	def check_if_approved
		if self.approved
			FeedbackMailer.send_appointment_approval(self).deliver
			puts 'it has been approved'
		end
	end

	def notify_clinic
		if !self.approved
			FeedbackMailer.notify_appointment(self).deliver
		end
	end


end
