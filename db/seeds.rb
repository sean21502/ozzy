require 'faker'

User.create!(
  email: 'sean@gmail.com',
  password: '123456',
  confirmed_at: '2017-11-15'
)

5.times do
  User.create!(
    email:    Faker::Internet.email,
    password: '123456',
    confirmed_at: '2017-11-14'
  )
end
users = User.all

#appilcation seed
10.times do
	application = Application.create!(
		user:  users.sample,
		name:  Faker::Name.name,
		url:  Faker::Name.name 
	)
end
applications = Application.all

#event seed
10.times do
	event = Event.create!(
		application:  applications.sample,
		name:  Faker::Name.name,
	)
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Application.count} applications created"
puts "#{Event.count} events created"