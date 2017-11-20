require 'random_data'

User.create!(
  email: 'sean@gmail.com',
  password: '123456',
  confirmed_at: '2017-11-15'
)

1.times do
  User.create!(
    email:    'happy@mail.com',
    password: '123456',
    confirmed_at: '2017-11-14'
  )
end
users = User.all

#appilcation seed
1.times do
	application = Application.create!(
		user:  users.sample,
		name:  'test app from seed',
		url:  'www.google.com' 
	)
end
applications = Application.all

#event seed
1.times do
	event = Event.create!(
		application:  applications.sample,
		name:  'test event from seed',
	)
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Application.count} applications created"
puts "#{Event.count} events created"