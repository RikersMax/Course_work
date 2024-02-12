class Product < ApplicationRecord
  belongs_to :target
  has_one :order
  has_one :storage

  validates(:name, presence: true)
  validates(:ident_number, presence: true)
  validates(:target_id, presence: true)
  validates(:quantity, numericality: true)

  validates(:name, uniqueness: true)
  validates(:ident_number, uniqueness: true)
end
