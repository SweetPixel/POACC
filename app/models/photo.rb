class Photo < ActiveRecord::Base
	
	has_many :category
	has_many :sub_category
end
