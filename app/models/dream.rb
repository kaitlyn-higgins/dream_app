class Dream < ApplicationRecord
  belongs_to :user
  has_many :tags

  validates :title, presence: true
end
