require 'twilio-ruby'
class TextMessage

  def self.create(copayer)
    venmo_url = TextMessage.generate_venmo_link(copayer)
    body = "Hey #{copayer.first_name}, please use venmo link to pay your part of #{copayer.bill.title}. #{venmo_url}"
    number = copayer.phone_number
    formatted_number = TextMessage.format_phone_number(number)
    # ready to send
    TextMessage.post_message(formatted_number, body)
  end

  def self.format_phone_number(number)
    number.gsub!(/[^0-9a-zA-Z]+/, '')
    if number.length == 11 && number[0] == '1'
      number = "+" + number
    else
      number = "+1" + number
    end
  end

  def self.generate_venmo_link(copayer)
    username = copayer.bill.user.venmo_user_name
    amount = copayer.amount
    note = copayer.bill.title.downcase
    "https://venmo.com/?txn=charge&recipients=#{username}&amount=#{amount}&note=#{note}&audience=private"
  end

  def self.post_message(number_to, body)
    account_id = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token 
   
    @client.account.messages.create({
      :from => ENV['TWILIO_NUMBER'], 
      :to => number_to, 
      :body => body,  
    })
  end
  
end