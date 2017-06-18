# frozen_string_literal: true

class User < ApplicationRecord
  has_many :conversations, through: :conversation_members
  has_many :messsages, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format:{with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,message: "Email address in invalid format"}
  validates :token, presence: true, uniquness: true
end
