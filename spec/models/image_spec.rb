require 'rails_helper'

RSpec.describe Image, type: :model do
  it "is not valid without a url" do
    expect(build(:image, url: '')).not_to be_valid
  end
end
