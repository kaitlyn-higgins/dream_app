class Theme < ApplicationRecord

  has_many :dream_themes
  has_many :dreams, through: :dream_themes
end
