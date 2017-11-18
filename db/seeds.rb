require 'random_data'

User.create!(
  email: 'sean@gmail.com',
  password: '123456',
  confirmed_at: '2017-11-15'
)

5.times do
  User.create!(
    email:    RandomData.random_email,
    password: RandomData.random_sentence,
    confirmed_at: '2017-11-14'
  )
end
users = User.all

10.times do
	application = Application.create!(
		user:  users.sample,
		name:  RandomData.random_sentence,
		url:  RandomData.random_sentence 
	)
end
applications = Application.all

10.times do
	event = Event.create!(
		application:  application.sample,
		name:  RandomData.random_sentence,
	)
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Application.count} applications created"
puts "#{Event.count} events created"