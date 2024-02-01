class Target < ApplicationRecord
  has_many :product

  validates(:name, presence: true)
end
