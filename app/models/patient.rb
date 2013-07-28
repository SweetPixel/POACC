class Patient < ActiveRecord::Base
	has_one :assessment
	has_many :followups
	has_many :appointments
	attr_accessible :Name, :Contact, :Email, :Address, :reg_no
end
