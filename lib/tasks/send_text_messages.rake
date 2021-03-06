task :send_text_messages => :environment do

  require 'text_message'

  Bill.all.each do |bill|
    if Date.today.day == bill.day_of_month
      bill.copayers.each do |copayer|
        TextMessage.create(copayer)
      end
    end 
  end

end