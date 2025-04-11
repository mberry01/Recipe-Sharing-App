class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  # Normalize email (trim + downcase)
  normalizes :email_address, with: ->(e) { e.strip.downcase }

  # Username: required, unique, and must be only letters/numbers/underscores
  validates :username,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A[a-zA-Z0-9_]+\z/,
              message: "Can only contain letters, numbers, and underscores"
            }

  # Email: required, unique, must match email format
  validates :email_address,
            presence: true,
            uniqueness: true,
            format: {
              with: URI::MailTo::EMAIL_REGEXP,
              message: "Must be a valid email"
            }

  # Password: minimum length of 6 characters
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end
