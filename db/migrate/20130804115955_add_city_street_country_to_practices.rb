class AddCityStreetCountryToPractices < ActiveRecord::Migration
  def change
    add_column :practices, :street, :string
    add_column :practices, :city, :string
    add_column :practices, :country, :string
  end
end
