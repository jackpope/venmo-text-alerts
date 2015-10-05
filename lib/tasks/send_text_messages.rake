require 'text_message'

Bill.each do |bill|
  if Date.today.day == bill.day_of_month
    bill.copayers.each do |copayer|
      TextMessage.create(copayer)
    end
  end 
end