class Address < ApplicationRecord

  belongs_to :customer

  def full_address
    "〒" + self.post_code + " " + self.address + " " + self.name
  end

end
