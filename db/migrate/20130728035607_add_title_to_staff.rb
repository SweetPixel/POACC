class AddTitleToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :title, :string
  end
end
