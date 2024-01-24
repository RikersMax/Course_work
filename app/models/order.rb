class Order < ApplicationRecord
  belongs_to :product
  belongs_to :movement
  belongs_to :employeer
end
