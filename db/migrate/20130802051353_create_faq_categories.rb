class CreateFaqCategories < ActiveRecord::Migration
  def change
    create_table :faq_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
