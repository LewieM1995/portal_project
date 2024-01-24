
class ClientDetail < ApplicationRecord
    # Validation for presence of client_id, client_name, email, and number
    validates :client_id, :client_name, :email, :number, presence: true
  
    # Validation for uniqueness of client_id
    validates :client_id, uniqueness: true
  
    # Validation for email format
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email format" }, presence: true
  
    # Validation for length of client_name and client_address
    validates :client_name, presence: true
    validates :client_address, presence: true
  
    # Validation for numericality of number
    validates :number, format: { with: /\A\d{11}\z/, message: "should be an 11-digit number" }, presence: true

  
    # Validation for length and format of client_postcode
    validates :client_postcode, presence: true
  end
  