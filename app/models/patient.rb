class Patient < ActiveRecord::Base
	has_many :assessments
	has_many :followups
end
