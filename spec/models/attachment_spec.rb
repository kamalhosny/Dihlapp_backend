require 'rails_helper'
require 'active_record/acts_as/matchers'

RSpec.describe Attachment, type: :model do
  it 'attachment should be actable' do
    expect(Attachment).to be_actable
  end
end
