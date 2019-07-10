class Dream < ApplicationRecord
  belongs_to :user
  has_many :tags
  has_many :dream_themes
  has_many :themes, through: :dream_themes

  validates :title, presence: true
  validates :title, length: {minimum: 2}
end
