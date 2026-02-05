class User < ApplicationRecord
    validates :password,
      length: { minimum: 6 },
      if: -> { new_record? || !password.nil? }

		validates :password, confirmation: true
		validates :password_confirmation, presence: true, if: -> { password.present? }

    validates :username,
  		presence: true,
    	length: { minimum: 3, maximum: 20 },
    	uniqueness: true

  validates :email,
  	presence: true,
  	uniqueness: true,
    format: { with: URI::MailTo::EMAIL_REGEXP }
end
