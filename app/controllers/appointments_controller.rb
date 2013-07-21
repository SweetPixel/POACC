class AppointmentsController < ApplicationController
	def index
	end

	def new_patient
		@appointment = Appointment.new
	end

	def old_patient
	end

	def create
		 #lets get the patient first
		 patient = Patient.all.find_by_reg_no(session[:reg_no])
		 #now lets book the appontment
		 @appointment = Appointment.new
		 @appointment.day = params[:day]
		 @appointment.requested_time = params[:requested_time]
		 @appointment.patient_id = patient.id
		 if @appointment.save
		 	redirect_to controller: "home", action: "index"
		 end
	end
end
