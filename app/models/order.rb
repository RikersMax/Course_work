class Order < ApplicationRecord
  belongs_to :product
  belongs_to :movement
  belongs_to :employee

  validates(:product_id, presence: true)
  validates(:quantity, presence: true)
  validates(:employee_id, presence: true)
end
