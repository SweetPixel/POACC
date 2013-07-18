class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.text :Complaints
      t.text :Clinical
      t.text :Investigation

      t.timestamps
    end
  end
end
