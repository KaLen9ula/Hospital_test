require 'rails_helper'

RSpec.describe User, type: :model do
  it 'invalid phone_number' do
    user = User.new(phone_num: "80228493kk", password: "password")
    validation = user.valid?
    expect(validation).not_to be_truthy
  end

  it 'valid phone_number' do
    user = User.new(phone_num: "80334444444", password: "password")
    validation = user.valid?
    expect(validation).to be_truthy
  end
end
