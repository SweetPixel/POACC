class Assessment < ActiveRecord::Base
	belongs_to :patient
	attr_accessible :Complaints,:Clinical,:Investigaton,:patient_id
end
