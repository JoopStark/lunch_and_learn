class User < ApplicationRecord
  before_validation :generate_api_key

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :favorites

  def generate_api_key
    unless self.api_key
      loop do
        self.api_key = SecureRandom.hex(10)
        break unless User.exists?(:api_key => api_key)
      end
    end
  end

  has_secure_password
end