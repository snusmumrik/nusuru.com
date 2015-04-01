class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :imageable, polymorphic: true

  has_attached_file :image,
  styles: { medium: "600x600>", thumb: "100x100#" },
  url: "/:attachment/:class/:id/:style/:basename.:extension",
  path: ":rails_root/public/:attachment/:class/:id/:style/:basename.:extension",
  default_url: "/:attachment/:class/missing/:style/missing.png",
  preserve_files: "true"

  delegate :path, :url, to: :image

  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :image_file_name, presence: true

  acts_as_paranoid
end
