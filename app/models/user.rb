class User < ActiveRecord::Base
  has_many :articles
  before_save {self.email = email.downcase}
  
  validates :username, presence: true, uniqueness:  { case_sesnsitive: false }, length: { minimum: 10, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sesnsitive: false }, format: {with: VALID_EMAIL_REGEX }, length: { minimum: 10, maximum: 60 }
end