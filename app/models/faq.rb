class Faq < ActiveRecord::Base
	belongs_to :faq_category
	attr_accessible :question, :answer, :faq_category_id


	
end
