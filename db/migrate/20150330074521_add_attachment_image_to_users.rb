class AddAttachmentImageToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :image, after: :last_sign_in_ip
    end
  end

  def self.down
    remove_attachment :users, :image
  end
end
