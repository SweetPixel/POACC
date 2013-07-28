class Practice < ActiveRecord::Base
	attr_accessible :name, :location, :description, :lat, :long
end
