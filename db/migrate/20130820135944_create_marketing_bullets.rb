class CreateMarketingBullets < ActiveRecord::Migration
  def change
    create_table :marketing_bullets do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
