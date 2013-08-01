class AppointmentsController < ApplicationController
	def index
	end

	def new_patient
		@appointment = Appointment.new
	end

	def old_patient
	end

	def booked
	end

	def not_booked
	end

	def createold
		patient = Patient.all.find_by_reg_no(params[:reg_no])
		# lets create an appointment
		if(patient == nil)
			redirect_to controller => "appointments", :action => "not_booked"
		else
			appointment = Appointment.new
			appointment.day = params[:request_date] #Date.civil(params[:request_date ][:year].to_i, params[:request_date ][:month].to_i, params[:request_date ][:day].to_i)
			appointment.requested_time = params[:request_time]
			appointment.patient_id = patient.id
			if appointment.save
				redirect_to controller: "appointments", action: "booked"
			end	
		end
	end

	def create
		 #lets get the patient first
		 patient = Patient.all.find_by_reg_no(session[:reg_no])
		 #now lets book the appontment
		 appointment = Appointment.new
		 appointment.day = params[:request_date] #Date.civil(params[:request_date ][:year].to_i, params[:request_date ][:month].to_i, params[:request_date ][:day].to_i)
		 appointment.requested_time = params[:requested_time]
		 appointment.patient_id = patient.id
		 if appointment.save
		 	redirect_to controller: "appointments", action: "booked"
		 end
		end
	end
