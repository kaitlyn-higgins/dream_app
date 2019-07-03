class Dream < ApplicationRecord
  belongs_to :user
  has_many :tags

  validates :title, presence: true
  validates :title, length: {minimum: 2}
end
