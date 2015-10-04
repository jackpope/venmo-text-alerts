require 'rails_helper'

RSpec.describe Copayer, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:copayer)).to be_valid
  end
  it "is invalid without a first name" do
    expect(FactoryGirl.build(:copayer, first_name: nil)).not_to be_valid
  end
  it "is invalid without a last name" do
    expect(FactoryGirl.build(:copayer, last_name: nil)).not_to be_valid
  end
  it "is invalid without a phone number" do
    expect(FactoryGirl.build(:copayer, phone_number: nil)).not_to be_valid
  end
  it "is invalid without an amount" do
    expect(FactoryGirl.build(:copayer, amount: nil)).not_to be_valid
  end
end
