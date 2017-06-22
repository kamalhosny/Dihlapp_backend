class Message < ApplicationRecord
  ## Associations
  has_many :images
  has_one :location
  belongs_to :conversation
  belongs_to :user
  after_create :broadcast
  accepts_nested_attributes_for :images, :location

  ## Validations
  validates :body, presence: true
  validate :images_and_location

  private
  def broadcast
  	ActionCable.server.broadcast('message', as_json.merge(action: 'CreateMessage'))
  end

  ## Custom Validations
  def images_and_location
    if self.images.present? && self.location.present?
      errors.add :base, 'You cannot send image and location together'
    end
  end
end
