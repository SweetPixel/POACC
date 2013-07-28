# This migration comes from spud_photos (originally 20120405042046)
class UpgradePhotoRelationships < ActiveRecord::Migration
  def change
    add_column :spud_photo_albums_photos, :id, :primary_key
    add_column :spud_photo_albums_photos, :order, :integer, :default => 0
    add_column :spud_photo_galleries_albums, :id, :primary_key
    add_column :spud_photo_galleries_albums, :order, :integer, :default => 0
  end
end