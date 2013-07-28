class AddPatientIdToFollowup < ActiveRecord::Migration
  def change
    add_column :followups, :patient_id, :integer
  end
end
