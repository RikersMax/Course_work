class Product < ApplicationRecord
  belongs_to :target
  has_one :order

  validates(:name, presence: true)
  validates(:ident_number, presence: true)
  validates(:target_id, presence: true)
end
