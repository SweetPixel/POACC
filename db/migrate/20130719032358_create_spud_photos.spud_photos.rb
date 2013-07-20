# This migration comes from spud_photos (originally 20120228232120)
class CreateSpudPhotos < ActiveRecord::Migration
  def change
    create_table :spud_photos do |t|
      t.string :title
      t.string :caption
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at
      t.timestamps
    end
  end
end