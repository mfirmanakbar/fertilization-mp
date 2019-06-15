class User < ApplicationRecord

  before_save { self.email = email.downcase }

  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: { minimum: 3, maximum: 25 }

  # tested on https://rubular.com/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: { minimum: 3, maximum: 105 },
  format: { with: VALID_EMAIL_REGEX }

  validates :password, presence: true, length: { minimum: 3, maximum: 25 }

  has_secure_password

end
