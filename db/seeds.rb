require 'faker'

# Wipe data
User.all.each {|u| u.delete}
Bill.all.each {|b| b.delete}
Copayer.all.each {|c| c.delete}

# Create my admin login
if !User.find_by(email: 'admin@example.com')
  me = User.new(
    first_name: 'Jack',
    last_name: 'Pope',
    email: 'admin@example.com',
    password: 'helloworld',
    venmo_user_name: 'jackpope1'
    )
  me.skip_confirmation!
  me.save
end

# Create other users
20.times do
  user = User.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: Faker::Lorem.characters(10),
      venmo_user_name: Faker::Internet.user_name,
      )
  user.skip_confirmation!
  user.save
end

# Create bills

# t.string   "title"
# t.text     "description"
# t.integer  "day_of_month"
# t.integer  "user_id"
# t.float    "total_amount"

User.all.each do |user|
  rand(1..3).times do
    user.bills.create(
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.sentence,
      day_of_month: rand(1..30),
      total_amount: Faker::Number.decimal(2)
      )
  end
end

# Create copayers

# t.string   "first_name"
# t.string   "last_name"
# t.text     "phone_number"
# t.float    "amount"
# t.integer  "bill_id"

Bill.all.each do |bill|
  rand(1..3).times do
    bill.copayers.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone_number: Faker::PhoneNumber.cell_phone.gsub!(/[^\(\)\d\+]/, '')[0...10],
      amount: Faker::Number.decimal(2)
      )
  end
end

puts "___________________________"
puts "Seeds Finished."
puts "Created:"
puts "___________________________"
puts "Users: #{User.count}     Bills: #{Bill.count}     Copayers: #{Copayer.count}"