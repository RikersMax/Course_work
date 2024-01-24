class Product < ApplicationRecord
  belongs_to :target
  has_one :order
end
