# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

50.times do 
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "hello")

end 
100.times do 
    Game.create(title: Faker::Game.title, description: Faker::Hipster.paragraph, genre: Faker::Game.genre, platform: Faker::Game.platform, creator_id: User.all.sample.id)
 end
 200.times do 
    Review.create(content: Faker::Hipster.sentence, comment: Faker::Hipster.sentence, reviewer_id: User.all.sample.id, game_id: Game.all.sample.id)
 end