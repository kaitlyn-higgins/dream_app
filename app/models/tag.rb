class Tag < ApplicationRecord
  belongs_to :dream

  def associated_dreams
    tags = Tag.where("name iLIKE ?", "%#{name}%")
    tags.map{ |tag| tag.dream }.uniq
  end

end
