require 'rails_helper'

RSpec.describe Location, type: :model do
  it 'is not valid if latitude is less than -90' do
    expect(build(:location, latitude: -100.000000)).not_to be_valid
  end

  it 'is not valid if latitude is more than 90' do
    expect(build(:location, latitude: 100.000000)).not_to be_valid
  end

  it 'is not valid if longitude is less than -180' do
    expect(build(:location, longitude: -200.000000)).not_to be_valid
  end

  it 'is not valid if longitude is more than 180' do
    expect(build(:location, longitude: 200.000000)).not_to be_valid
  end

  it 'is not valid without a latitude' do
    expect(build(:location, latitude: '')).not_to be_valid
  end

  it 'is not valid without a longitude' do
    expect(build(:location, longitude: '')).not_to be_valid
  end
end
