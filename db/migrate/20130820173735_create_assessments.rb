class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.integer :patient_id
      t.text :main_complaints
      t.text :clinical_medical_history
      t.text :investigational_medical_history
      t.text :examination_bp
      t.text :examination_pulse
      t.text :examination_wt
      t.text :examination_ht
      t.text :cv
      t.text :chest
      t.text :git
      t.text :gut
      t.text :skin
      t.text :neck
      t.text :right_shoulder
      t.text :left_shoulder
      t.text :right_arm
      t.text :left_arm
      t.text :right_elbow
      t.text :left_elbow
      t.text :right_forearm
      t.text :left_forearm
      t.text :right_wrist
      t.text :left_wrist
      t.text :thoracic_spine
      t.text :lumber_spine
      t.text :sacrococcyx_spine
      t.text :pelvis
      t.text :right_hipjoint
      t.text :left_hipjoint
      t.text :right_thigh
      t.text :left_thigh
      t.text :right_knee
      t.text :left_knee
      t.text :right_leg
      t.text :left_leg
      t.text :right_ankle
      t.text :left_ankle
      t.text :plan

      t.timestamps
    end
  end
end
