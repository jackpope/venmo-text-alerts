require 'rails_helper'
require 'text_message'

describe 'text_message' do

  describe '#generate_venmo_link' do
    it "correctly applies parameters" do
      user = User.new(first_name: 'John', last_name: 'Doe', email: 'example@example.com', password: 'helloworld', venmo_user_name: 'testusername')
      user.skip_confirmation!
      user.save
      bill = user.bills.create(title: 'Test', description: 'Test description', total_amount: 50, day_of_month: 15)
      copayer = bill.copayers.create(first_name: 'Mary', last_name: 'Jane', phone_number: '888-777-6666', amount: 25)
      expect(TextMessage.generate_venmo_link(copayer)).to eq("https://venmo.com/?txn=charge&recipients=testusername&amount=25.0&note=test&audience=private")
    end
  end

  describe "#format_phone_number" do
    it "remove symbols from phone number string and adds country code" do
      expect(TextMessage.format_phone_number("(860)-864-8987")).to eq('+18608648987')
    end
    it "can handle numbers already including the 1 country code" do
      expect(TextMessage.format_phone_number("1-860-451/3321")).to eq('+18604513321')
    end
  end

end