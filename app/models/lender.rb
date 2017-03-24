class Lender < ApplicationRecord
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  PASSWORD_VALIDATOR = /(?=.*[A-Z])(?=.*\d)/
  validates :first_name, :last_name, :email, :password, :money, presence: true
  validates :email, uniqueness: { case_sensitive:false }, format: { with: EMAIL_REGEX}
  validates :password, length: {minimum: 8}, format: {with: PASSWORD_VALIDATOR}
  has_many :loans
  has_many :debtors, through: :loans, source: :borrower
end
