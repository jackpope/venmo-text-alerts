require 'rails_helper'

RSpec.describe Bill, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:bill)).to be_valid
  end
  it "is invalid without a title" do
    expect(FactoryGirl.build(:bill, title: nil)).not_to be_valid
  end
  it "is invalid without a total_amount" do
    expect(FactoryGirl.build(:bill, total_amount: nil)).not_to be_valid
  end
  it "is invalid without a day_of_month" do
    expect(FactoryGirl.build(:bill, day_of_month: nil)).not_to be_valid
  end
  it "is invalid with day of month > 28" do
    expect(FactoryGirl.build(:bill, day_of_month: 29)).not_to be_valid
  end
  it "is invalid with a day of month < 1" do
    expect(FactoryGirl.build(:bill, day_of_month: 0)).not_to be_valid
  end

  describe "#amount_left" do
    it "equals the amount of money left over after one copayer is added" do
      bill = Bill.new(title: 'Sample title', description: 'Sample description', user_id: 1, total_amount: 500, day_of_month: 12)
      bill.save
      expect(bill.amount_left).to eq(500)
    end
    it "equals the amount of money left over after one copayer is added" do
      bill = Bill.new(title: 'Sample title', description: 'Sample description', user_id: 1, total_amount: 500, day_of_month: 12)
      bill.save
      copayer = bill.copayers.new(first_name: "John", last_name: "Doe", phone_number: '8605555555', amount: 50)
      copayer.save
      expect(bill.amount_left).to eq(450)
    end
    it "equals the amount of money left over after multiple copayers are added" do
      bill = Bill.new(title: 'Sample title', description: 'Sample description', user_id: 1, total_amount: 500, day_of_month: 12)
      bill.save
      4.times do
        copayer = bill.copayers.new(first_name: "John", last_name: "Doe", phone_number: '8605555555', amount: 50)
        copayer.save
      end
      expect(bill.amount_left).to eq(300)
    end
  end
end
