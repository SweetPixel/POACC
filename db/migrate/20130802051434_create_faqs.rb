class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :question
      t.text :answer
      t.integer :faq_category_id

      t.timestamps
    end
  end
end
