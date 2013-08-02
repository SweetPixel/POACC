class FaqCategory < ActiveRecord::Base
	has_many :faqs
	attr_accessible :title
end
