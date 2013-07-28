class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :title
      t.text :description

      t.timestamps
    end
  end
end
