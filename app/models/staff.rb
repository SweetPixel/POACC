class Staff < ActiveRecord::Base
	attr_accessible :name, :title, :qualification, :biography, :picture
	has_attached_file :picture, :styles => {
		:tiny => "25x25#",
		:thumbnail => "100x100#",
		:small  => "150x150>",
		:medium => "300x300>" }
		
		attr_accessor :delete_picture

		before_validation {self.picture.clear if self.delete_picture == '1'}
	end
