# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.destroy_all
User.destroy_all
Gossip.destroy_all

City.create(name: "Lyon", zip_code: "69003")
10.times do |index|
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
  puts "#{index+1} city created"
end

10.times do |index|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Quote.most_interesting_man_in_the_world,
    email: Faker::Internet.free_email,
    age: Faker::Number.between(from: 10, to: 60),
    city: City.find(rand(1..10)),
    password: Faker::Alphanumeric.alphanumeric(number: 10)
  )
    puts "#{index+1} user created"
end

20.times do |index|
  Gossip.create!(
    title: Faker::Games::ElderScrolls.race,
    content: Faker::Quote.famous_last_words,
    user: User.find(rand(1..10))
  )
  puts "#{index+1} gossip created"
end

50.times do |index|
  Comment.create!(
    content: Faker::Quote.robin,
    user: User.find(rand(1..10)),
    gossip: Gossip.find(rand(1..20))
  )
  puts "#{index+1} comment created"
end

#10.times do |index|
#  Tag.create(title: Faker::Games::Pokemon.name)
#  puts "#{index+1} tag created"
#end

5.times do |index|
  LikeDislike.create!(
    user: User.find(rand(1..10)),
    like: Gossip.find(rand(1..20))
  )
  puts "#{index} like created"
end

5.times do |index|
  LikeDislike.create!(
    user: User.find(rand(1..10)),
    dislike: Gossip.find(rand(1..20))
  )
  puts "#{index} like created"
end
#40.times do |index|
#  TagGossip.create(tag: Tag.find(rand(1..10)), gossip: Gossip.find(rand(1..20)))
#  puts "#{index+1} gossip taggé"
#end
