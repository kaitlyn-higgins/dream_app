class Tag < ApplicationRecord
  belongs_to :dream

  def associated_dreams
    tags = Tag.where("name iLIKE ?", "%#{name}%")
    tags.map{ |tag| tag.dream }.uniq
  end



  validates :name, presence: true, length: {maximum: 25}, length: {minimum: 2}

end
