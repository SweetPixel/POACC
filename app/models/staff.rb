class Staff < ActiveRecord::Base
	attr_accessible :name, :title, :qualification, :biography, :picture
end
