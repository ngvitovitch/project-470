# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_dwelling_and_owner(dwelling_num)
	owner = User.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: "owner_#{dwelling_num}@example.com",
		password: 'test'
	)
	dwelling = Dwelling.create(name: Faker::Address.street_address, owner: owner, time_zone: 'Eastern Time (US & Canada)')
	owner.dwelling = dwelling
	owner.save
	return dwelling
end

def create_user(user_num, dwelling_num, dwelling)
	user = User.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: "user_#{user_num}_#{dwelling_num}@example.com",
		password: 'test'
	)
	user.dwelling = dwelling
	user.save
end
def create_bill(name, dwelling)
    bill = Bill.create(
      name: name,
      owed_to: Faker::Company.name, 
      amount: 800.55 + rand(500),
      date_due: Date.today.next_month,
      status: 'unpaid'
    )
    bill.dwelling = dwelling
    bill.save
end

def create_event(title, past, dwelling)
	if past
		time = Time.now - 1.day - Random.rand(1.week)
	else
		time = Time.now + Random.rand(1.week)
	end

	event = Event.create(
		title: title,
		description: Faker::Lorem.sentences(3).join,
		date: time
	)
	event.user = dwelling.users.all[Random.rand(dwelling.users.size)]
	event.dwelling = dwelling
	event.save
end

# Create 10 dwellings with owners
10.times do |dwelling_num|
	dwelling = create_dwelling_and_owner(dwelling_num)
  # Create 4 roomates
  4.times do |user_num|
		create_user(user_num, dwelling_num, dwelling)
  end

  # Create 2 bills
  ['Rent','Food'].each do |name|
		create_bill(name, dwelling)
  end                  

  # Create events by random users, 3 at random times within the next week
	# 2 last week
  ['Game Night', 'Tacos!', 'Poker Night', 'Game of Thrones', 'Hack-a-thon'].each_with_index do |title, i|
		create_event(title, i < 2, dwelling)
  end

	# Create a shopping list 
	
	shopping_list = ShoppingList.new(
		title: 'Groceries')
	shopping_list.dwelling = dwelling
	shopping_list.save
	['Eggs', 'Bread', 'Milk'].each do |item_name|
		shopping_list.shopping_list_items.create(name: item_name)
	end

end

puts "Created #{User.count} Users"
puts "Created #{Dwelling.count} Dwellings"
puts "Created #{Bill.count} Bills"
puts "Created #{Event.count} Events"
puts "Created #{ShoppingList.count} Shopping Lists"
