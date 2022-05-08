# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Booking.destroy_all
Accommodation.destroy_all
User.destroy_all
City.destroy_all

### Create 5 cities
5.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Number.number(digits: 5).to_s)
end

### Create 10 users
10.times do
  User.create(email: "email_#{Faker::Number.number(digits: 4)}@mail.com",
  phone_number: "01" + (Faker::Number.number(digits: 8)).to_s,
  description: "Generated description ##{Faker::Number.number(digits: 5)}",
  city: City.all.sample)
end

### Create 50 accomodations
50.times do
  Accommodation.create(available_beds: rand(1..5), price: rand(20..300), has_wifi: Faker::Boolean.boolean,
  city: City.all.sample, admin: User.all.sample)
end

### Create 20 bookings
# 20.times do
#   booking_date = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
#   Booking.create(start_date: booking_date, end_date: booking_date + rand(1..7), 
#   guest: User.all.sample, accommodation: Accommodation.all.sample)
# end


booking_date = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
day = 24*60*60
target_accom = Accommodation.all.sample

Booking.create(start_date: booking_date, end_date: booking_date + 3*day, 
guest: User.all.sample, accommodation: target_accom)

Booking.create(start_date: booking_date + 5*day, end_date: booking_date + 8*day, 
guest: User.all.sample, accommodation: target_accom)

Booking.create(start_date: booking_date + 10*day, end_date: booking_date + 13*day, 
guest: User.all.sample, accommodation: target_accom)

Booking.create(start_date: booking_date + 11*day, end_date: booking_date + 16*day, 
guest: User.all.sample, accommodation: target_accom)
