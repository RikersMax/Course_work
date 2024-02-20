class User < ApplicationRecord
  belongs_to :employee
  belongs_to :role

  validates(:login, presence: true)
  validates(:password, presence: true)
end
