class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  acts_as_paranoid

  has_attached_file :image,
  styles: { medium: "300x300>", thumb: "100x100>" },
  url: "/images/:class/:id/:style/:basename.:extension",
  path: ":rails_root/public/:attachment/:class/:id/:style/:basename.:extension",
  default_url: "/images/:class/missing/:style/missing.png"

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :name, presence: true
  validates :email, uniqueness: true
end
