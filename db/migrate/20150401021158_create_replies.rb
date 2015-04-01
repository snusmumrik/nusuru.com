class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :user, index: true
      t.references :post, index: true
      t.string :text

      t.timestamps null: false
      t.datetime :deleted_at
    end
    add_foreign_key :replies, :users
    add_foreign_key :replies, :posts
  end
end
