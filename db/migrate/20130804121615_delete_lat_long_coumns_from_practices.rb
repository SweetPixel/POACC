class DeleteLatLongCoumnsFromPractices < ActiveRecord::Migration
  def change
  	remove_column :practices, :lat
  	remove_column :practices, :long
  end
end
