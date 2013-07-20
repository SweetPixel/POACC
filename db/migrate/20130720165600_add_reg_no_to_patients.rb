class AddRegNoToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :reg_no, :integer
  end
end
