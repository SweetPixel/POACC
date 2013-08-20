class CreateUserFeedbacks < ActiveRecord::Migration
  def change
    create_table :user_feedbacks do |t|
      t.string :firstname
      t.string :lastname
      t.string :emailaddress
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
