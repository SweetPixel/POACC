class CreateFollowups < ActiveRecord::Migration
  def change
    create_table :followups do |t|
      t.date :Date
      t.text :ClinicalPicture
      t.text :Plan

      t.timestamps
    end
  end
end
