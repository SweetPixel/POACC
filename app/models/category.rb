class Category < ActiveRecord::Base
	belongs_to :photo
	has_many :sub_category
end
