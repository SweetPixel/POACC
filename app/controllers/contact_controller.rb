class ContactController < ApplicationController
	def feedback
		f = UserFeedback.new
		f.firstname = params[:firstname]
		f.lastname = params[:lastname]
		f.emailaddress = params[:emailaddress]
		f.message  = params[:message]
		FeedbackMailer.feedbackform(f).deliver
	end
end
