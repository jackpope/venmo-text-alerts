require 'twilio-ruby'
class TextMessage

  def self.create(copayer) # sends two text messages with link
    venmo_url = TextMessage.generate_venmo_link(copayer)
    body_one = "Hey #{copayer.first_name}, please use venmo link to pay your part of #{copayer.bill.title}."
    body_two = "Link: #{venmo_url}"
    formatted_number = TextMessage.format_phone_number(copayer.phone_number)
    # ready to send
    TextMessage.post_message(formatted_number, body_one)
    sleep 10
    TextMessage.post_message(formatted_number, body_two)
  end

  def self.format_phone_number(number)
    number.gsub!(/[^0-9a-zA-Z]+/, '')
    if number.length == 11 && number[0] == '1'
      number = "+" + number
    else
      number = "+1" + number
    end
    number
  end

  def self.generate_venmo_link(copayer)
    username = copayer.bill.user.venmo_user_name
    amount = copayer.amount
    note = copayer.bill.title.downcase.split.join("%20")
    "https://venmo.com/?txn=pay&recipients=#{username}&amount=#{amount}&note=#{note}&audience=private"
  end

  def self.post_message(number_to, body)
    client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'])
 
    client.account.messages.create({
      from: "+" + ENV['TWILIO_NUMBER'], 
      to: number_to, 
      body: body  
    })
  end

end