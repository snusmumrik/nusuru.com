class Post < ActiveRecord::Base
  belongs_to :user
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images

  acts_as_paranoid

  validates :title, :location, presence: true
end
