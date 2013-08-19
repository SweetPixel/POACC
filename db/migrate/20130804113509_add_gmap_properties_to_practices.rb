class AddGmapPropertiesToPractices < ActiveRecord::Migration
	def change
	  	add_column :practices, :latitude,  :float #you can change the name, see wiki
		add_column :practices, :longitude, :float #you can change the name, see wiki
		add_column :practices, :gmaps, :boolean #not mandatory, see wiki
	end
end
