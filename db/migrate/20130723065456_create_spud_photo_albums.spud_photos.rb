# This migration comes from spud_photos (originally 20120228232329)
class CreateSpudPhotoAlbums < ActiveRecord::Migration
  def change
    create_table :spud_photo_albums do |t|
      t.string :title
      t.string :url_name
      t.timestamps
    end
    create_table :spud_photo_albums_photos, :id => false do |t|
      t.integer :spud_photo_album_id
      t.integer :spud_photo_id
    end
    add_index :spud_photo_albums, :url_name, :name => "idx_album_url_name"
    add_index :spud_photo_albums_photos, :spud_photo_album_id, :name => "idx_album_id"
  end
end
