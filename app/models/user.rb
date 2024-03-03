class User < ApplicationRecord
  attr_accessor :remember_token

  belongs_to :employee
  belongs_to :role

  validates(:login, presence: true)
  validates(:password, presence: true)


  def remember_me
    self.remember_token = SecureRandom.urlsafe_base64
    update_column(:remember_token_digest, digest(remember_token))
  end

  def forget_me
    update_column(:remember_token_digest, nil)
    self.remember_token = nil
  end

  def remember_token_authenticated?(remember_token)
    return false unless remember_token_digest.present?
    BCrypt::Password.new(remember_token_digest).is_password?(remember_token)
  end

  private

  def digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
