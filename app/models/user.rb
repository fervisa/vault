class User < ActiveRecord::Base
  has_secure_password

  has_many :credentials

  validates :email, presence: true
end
