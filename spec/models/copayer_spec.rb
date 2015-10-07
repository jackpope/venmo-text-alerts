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

  it "is invalid if the total exceeds total_amount of bill" do
    bill = Bill.new(title: 'title', description: 'description', user_id: 1, total_amount: 100, day_of_month: 15)
    bill.save
    first_copayer = bill.copayers.create(
      first_name: 'John',
      last_name: 'Doe',
      phone_number: "111-111-1111",
      amount: 80
      )
    expect(FactoryGirl.build(:copayer, amount: 25, bill_id: bill.id)).not_to be_valid
  end

  describe "custom phone number validation" do
    it "is invalid with a phone number less than 10 digits" do
      expect(FactoryGirl.build(:copayer, phone_number: "12345678")).not_to be_valid
    end
    it "is invalid with a phone number more than 10 digits" do
      expect(FactoryGirl.build(:copayer, phone_number: "123456789123456789")).not_to be_valid
    end
    it "it valid with a phone number exactly 10 digits" do
      expect(FactoryGirl.build(:copayer, phone_number: "1234567891")).to be_valid
    end
  end

  describe "#name" do
    it "joins the first and last name" do
      copayer = FactoryGirl.build(:copayer, first_name: 'John', last_name: 'Doe')
      expect(copayer.name).to eq("John Doe")
    end
  end

end
