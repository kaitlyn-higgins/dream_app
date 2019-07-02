class User < ApplicationRecord
  has_many :dreams

  has_secure_password
    validates :email, presence: true, uniqueness: true

  validates :username, :zip_code, presence: true
  validates :username, uniqueness: true, length: {minimum: 2}, length: {maximum: 25}
end
