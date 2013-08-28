class FeedbackMailer < ActionMailer::Base
  default from: "poacc.alert@gmail.com"

  def feedbackform(f)
  	@feedback = f
  	mail(to: "traumaconsultant@yahoo.com", subject: "New Feedback from POACC Website")
  end


  def notify_appointment(a)
  	@appointment = a
  	mail(to: "traumaconsultant@yahoo.com",cc: "drkhaqan@poacc.com" subject: "New Appointment Requested")
  end

  def send_appointment_approval(a)
  	@appointment = a
  	mail(to: "traumaconsultant@yahoo.com",cc: "drkhaqan@poacc" subject: "Appointment Confirmation from POACC")
  end

end
