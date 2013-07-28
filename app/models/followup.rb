class Followup < ActiveRecord::Base
	belongs_to :patient
	attr_accessible :Date, :ClinicalPicture, :Plan
end
