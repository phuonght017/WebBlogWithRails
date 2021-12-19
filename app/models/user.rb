class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  has_many :posts, dependent: :destroy 
  has_many :comments, dependent: :destroy 
end
