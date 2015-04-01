class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  acts_as_paranoid

  validates :text, presence: true
end
