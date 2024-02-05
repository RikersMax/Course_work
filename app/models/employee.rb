class Employee < ApplicationRecord
  has_one :order

  validates(:number, uniqueness: true)
end
