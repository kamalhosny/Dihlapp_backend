require 'rails_helper'

RSpec.describe ConversationMember, type: :model do
  # Association test
  # ensure Topic model has a one to many relationship with the quizzes model
  it { should belongs_to(:user) }
  it { should belongs_to(:conversation) }

end