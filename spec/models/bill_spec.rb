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
end
