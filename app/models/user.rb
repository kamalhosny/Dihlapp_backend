# frozen_string_literal: true

class User < ApplicationRecord
  has_many :conversations, through: :conversation_members
  has_many :messages
  # before_save :encrypt_token

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format:{with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,message: "Email address in invalid format"}
  validates :token, presence: true, uniqueness: true

  def self.authenticate(email,token)
   user = find_by(email: email)
   if user && user.token == token
     user
   else
     nil
   end
 end

  # def encrypt_token
  #   if token.present?
  #     self.token_hash = BCrypt::Engine.
  #   end
  # end
end
