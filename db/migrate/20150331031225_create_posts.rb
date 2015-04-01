class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true
      t.string :title
      t.string :location
      t.date :date
      t.string :model
      t.string :chassis_number
      t.string :registration_number
      t.string :features
      t.string :situation

      t.timestamps null: false
      t.datetime :deleted_at
    end
    add_foreign_key :posts, :users
  end
end
