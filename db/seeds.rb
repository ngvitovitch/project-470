# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create 10 dwellings with owners
10.times do |i|

  # Create the dwelling owner
  owner = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "owner_#{i}@example.com",
    password: 'test'
  )
  dwelling = Dwelling.create(name: Faker::Address.street_address, owner: owner, time_zone: 'Eastern Time (US & Canada)')
  owner.dwelling = dwelling
  owner.save

  # Create 4 roomates
  4.times do |j|
    user = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: "user_#{i}_#{j}@example.com",
      password: 'test'
    )
    user.dwelling = dwelling
    user.save
  end

  # Create 2 bills
  ['Rent','Food'].each do |k|
    bill = Bill.create(
      name: k,
      owed_to: Faker::Company.name, 
      amount: 800.55 + rand(500),
      date_due: Date.today.next_month,
      status: 'unpaid'
    )
    bill.dwelling = dwelling
    bill.save
  end                  

  # Create events by random users, 3 at random times within the next week
	# 2 last week
  5.times do |i|
		if i > 2
			time = Time.now - 1.day - Random.rand(1.week)
		else
			time = Time.now + Random.rand(1.week)
		end
    event = Event.create(
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.sentences(3).join,
      date: time
    )
    event.user = dwelling.users.all[Random.rand(dwelling.users.size)]
    event.dwelling = dwelling
    event.save
  end

  #Create 2 messages by random users
  2.times do |i|
    time = Time.now - Random.rand(1.week)
    message = Message.create(
      body: Faker::Lorem.sentences(3).join,
      date: time
    )
    message.user = dwelling.users.all[Random.rand(dwelling.users.size)]
    message.dwelling = dwelling
    message.save
  end
end

puts "Created #{User.count} Users"
puts "Created #{Dwelling.count} Dwellings"
puts "Created #{Bill.count} Bills"
puts "Created #{Event.count} Events"
