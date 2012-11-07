class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :role
  has_secure_password
  
  
  before_save { self.email.downcase! }
  before_create :generate_remember_token
  
  #Validations
  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create

  
  
  ROLES = [
    [0, "User"],
    [1, "Admin"]
  ]
  
  def generate_remember_token
    begin
        self.remember_token = SecureRandom.urlsafe_base64
    end while self.class.exists?(remember_token: self.remember_token)
  end
  
  private :generate_remember_token
end
