class User < ApplicationRecord
  has_many :dreams

  has_secure_password
    validates :email, presence: true, uniqueness: true

  # validates :username, :zip_code, presence: true
  validates :username, uniqueness: true, length: {minimum: 2}, length: {maximum: 25}


  # geocodio = Geocodio::Client.new("26c6244d252252d42dd72c6d548576882578cd5")
  # coordinates = geocodio.geocode(params[:zip_code])
  # geocoded_by :zip_code
  # reverse_geocoded_by :latitude, :longitude do |obj,results|
  #   if geo = results.first
  #     zip_code = geo.postal_code.to_f
  #   end
  # end
  # after_validation :reverse_geocode
  # after_validation :geocode, if: ->(user){ user.zip_code.present? and user.zip_code_changed? }
end
