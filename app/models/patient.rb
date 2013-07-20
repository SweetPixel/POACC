class Patient < ActiveRecord::Base
	has_one :assessment
	has_many :followups
	attr_accessible :Name, :Contact, :Email, :Address
end
