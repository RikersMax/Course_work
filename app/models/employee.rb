class Employee < ApplicationRecord
  has_many :order
  has_one :user

  validates(:number, uniqueness: true)
  validates(:number, length: {is: 4})

  validates(:name, presence: true)
end
