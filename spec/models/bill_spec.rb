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
  it "is invalid without a due_date" do
    expect(FactoryGirl.build(:bill, due_date: nil)).not_to be_valid
  end
end
