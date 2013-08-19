class AddAttachmentPictureToStaffs < ActiveRecord::Migration
  def self.up
    change_table :staffs do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :staffs, :picture
  end
end
