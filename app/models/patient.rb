class Patient < ActiveRecord::Base
	has_one :assessments
	has_many :followups
end
