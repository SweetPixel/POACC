class AddPatientIdToAssessments < ActiveRecord::Migration
  def change
    add_column :assessments, :patient_id, :integer
  end
end
