# This migration comes from spud_photos (originally 20120228232344)
class CreateSpudPhotoGalleries < ActiveRecord::Migration
  def change
    create_table :spud_photo_galleries do |t|
      t.string :title
      t.string :url_name
      t.timestamps
    end
    create_table :spud_photo_galleries_albums, :id => false do |t|
      t.integer :spud_photo_gallery_id
      t.integer :spud_photo_album_id
    end
    add_index :spud_photo_galleries, :url_name, :name => "idx_gallery_url_name"
    add_index :spud_photo_galleries_albums, :spud_photo_gallery_id, :name => "idx_gallery_id"
  end
end
