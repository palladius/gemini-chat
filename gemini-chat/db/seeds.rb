# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

def create_stuff()
  puts("Creating stuff on seed..")
  Room.create(name: 'Music')
  Room.create(name: 'Gemini') # model
  room_gcp = Room.create(name: 'GoogleCloud') # model
  # why uppercase?!?
  User.create(username: 'drake')
  User.create(username: 'elon')
  larry = User.create(username: 'larry')
  User.create(username: 'sergey')
  # better
  User.create(username: 'ricc')

  # Messages

  Message.create(
    user_id: larry.id ,
    room_id: room_gcp.id,
    content: "created by rake db:seed on #{Time.now}" )
end


create_stuff unless IsCloudRun
