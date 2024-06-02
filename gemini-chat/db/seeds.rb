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
  music_room = Room.create(name: 'Music')
  gemini_room = Room.create(name: 'Gemini') # model
  room_gcp = Room.create(name: 'GoogleCloud') # model
  # why uppercase?!?
  User.create(username: 'drake')
  User.create(username: 'elon')
  larry = User.create(username: 'larry')
  User.create(username: 'sergey')
  # better
  ricc = User.create(username: 'ricc')
  gemini = User.create(username: 'gemini-1.5-flash', is_bot: true)

  # Messages

  Message.create(
    user_id: larry.id ,
    room_id: room_gcp.id,
    msg_type: 'person',
    content: "This room was created by rake db:seed on #{Time.now}, in order to talk about anything GCP-related." )

    Message.create(
      user_id: gemini.id ,
      room_id: room_gcp.id,
      msg_type: 'bot',
      content: "Bella Larry, did you know I come from Bologna?" )

    Message.create(
      user_id: gemini.id ,
      room_id: gemini_room.id,
      msg_type: 'bot',
      content: "Hi everyone, I'm Gemini. Riccardo plans on adding Gemini functionality on these chats some time soon." )

    Message.create(
      user_id: ricc.id ,
      room_id: music_room.id,
      #msg_type: 'bot',
      content: "I love Dream Theater, Queen, Kings of Leon, and Genesis from Peter Gabriel era." )

  end


create_stuff unless IsCloudRun
