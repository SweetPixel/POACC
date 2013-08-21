class ChangeDayDatatype < ActiveRecord::Migration
  def change
  	change_column :appointments, :day, :date
  end
end
