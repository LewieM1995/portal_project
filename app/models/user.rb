require 'bcrypt'

class User < ApplicationRecord
    before_create :generate_client_id
    before_save :encrypt_password

    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone, presence: true
    validates :address_first, presence: true
    validates :postcode, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :dob, presence: true

    def after_create do 
      Stripe::Customer.create(email: self.email)
    end
    
    private
  
    def generate_client_id
      self.client_id = "#{first_name[0]}#{last_name[0]}#{postcode[0..2]}#{rand(1000..9999)}"
    end
  
    def encrypt_password
        puts "Password before encryption: #{password}"
        self.password_digest = BCrypt::Password.create(password) if password.present?
        puts "Password after encryption: #{password_digest}"
    end
      
  end
  
