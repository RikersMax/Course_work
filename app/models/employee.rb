class Employee < ApplicationRecord
  has_one :order
  has_many :user

  validates(:number, uniqueness: true)
end
