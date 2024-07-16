class Order < ApplicationRecord
  belongs_to :product
  belongs_to :movement


  validates(:product_id, presence: true)
  validates(:quantity, presence: true)

end
