class Credential < ActiveRecord::Base
  has_secure_password

  belongs_to :user

  validates :name, :user, presence: true
end
