class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :user, index: true
      t.references :imageable, polymorphic: true
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps null: false
      t.datetime :deleted_at
    end
    add_foreign_key :images, :users
  end
end
