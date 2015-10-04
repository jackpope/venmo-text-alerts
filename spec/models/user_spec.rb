require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  it "is invalid without first name" do
    expect(FactoryGirl.build(:user, first_name: nil)).not_to be_valid
  end
  it "is invalid without last name" do
    expect(FactoryGirl.build(:user, last_name: nil)).not_to be_valid
  end
  it "is invalid without venmo user name" do
    expect(FactoryGirl.build(:user, venmo_user_name: nil)).not_to be_valid
  end
  it "is invalid without an email" do
    expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
  end
  it "is invalid without a password" do
    expect(FactoryGirl.build(:user, password: nil)).not_to be_valid
  end

  describe "#name" do
    it "joins the first and last name" do
      user = FactoryGirl.build(:user, first_name: 'John', last_name: 'Doe')
      expect(user.name).to eq("John Doe")
    end
  end
  
end
