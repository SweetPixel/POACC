class FeedbackMailer < ActionMailer::Base
  default from: "poacc.alert@gmail.com"

  def feedbackform(f)
  	@feedback = f
  	mail(to: "traumaconsultant@yahoo.com", subject: "New Feedback from POACC Website")
  end
end
