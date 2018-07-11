# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Message.destroy_all
User.destroy_all
Channel.destroy_all


# Channel creation
Channel.create(name: "general")
Channel.create(name: "paris")
Channel.create(name: "react")
channels = ["general", "paris", "react"]

# User creation
User.create(email: "boubou@gmail.com", nickname:'boubou', password: "123456")
User.create(email: "bobo@gmail.com",  nickname:'bobo',password: "123456")
User.create(email: "bibi@gmail.com", nickname:'bibi', password: "123456")
users = ["boubou@gmail.com", "bobo@gmail.com", "bibi@gmail.com"]

# Message creation
20.times do
  user = User.all.sample
  channel = Channel.all.sample
  Message.create(content: Faker::SiliconValley.motto, user: user, channel: channel)
end
