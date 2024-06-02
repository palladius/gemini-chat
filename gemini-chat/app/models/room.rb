class Room < ApplicationRecord
  validates_uniqueness_of :name
  scope :public_rooms, -> { where(is_private: false) }
  has_many :participants, dependent: :destroy
  after_create_commit { broadcast_if_public }
  #after_create_commit { answer_with_gemini_if_public }
  has_many :messages

  def broadcast_if_public
    broadcast_append_to "rooms" unless self.is_private
    # unless self.is_private
    #   answer_with_gemini if haunted_by_gemini?
    # end
  end

  def answer_with_gemini_if_public
    answer_with_gemini if ((not self.is_private) && haunted_by_gemini?)
  end

  def self.create_private_room(users, room_name)
    single_room = Room.create(name: room_name, is_private: true)
    users.each do |user|
      Participant.create(user_id: user.id, room_id: single_room.id )
    end
    single_room
  end

  # TODO move to model
  def haunted_by_gemini?
    self.name.to_s == "Gemini" ||
      self.name.match?(/Carlesso/ ) # /🤖/
    # 🤖 gemini-1.5-flash
  end

  def self.emoji = '🚪'
  def self.names = all.map{|x| x.name }

  def gemini_thread_response
    gemini_response = GeminiLLM.chat(messages: self.messages_for_gemini)
    gemini_response.raw_response['candidates'][0]['content']['parts'][0]['text']
  end

  def answer_with_gemini
    #puts '♊️♊️♊️ answer_with_gemini() BEGIN: This might take a while..'
    # First lets DEFUSE the even remote possibility of deadlock. Gemini should only
    # 1. respond to USER type of questions
    # 2. answer with ROBOT or whatevs type of questions
    # messages_for_gemini shou
    unless should_respond_with_gemini?
      puts "♊️♊️♊️ No point in answering. Returning"
      return false
    end
    response = gemini_thread_response rescue nil
    return nil unless response.to_s.length > 3
    # we have a response, lets save a message!
    gemini_model = GeminiLLM.defaults[:chat_completion_model_name]
    gemini_user = User.find_or_create_by(username: gemini_model, is_bot: true)
    #m =
    Message.create(
      user_id: gemini_user.id,
      room_id: self.id,
      msg_type: 'MODEL',
      content: response,
      internal_stuff: 'This is a real answer from Gemini as a response to a chat. TODO make sure the last msg is from a USER'
    )
  end

  # structures messages of a chat in Gemini (and possibly assistant) form
  def messages_for_gemini
    # https://cloud.google.com/vertex-ai/generative-ai/docs/model-reference/gemini
    self.messages.map{ |msg|
      role = msg.user.is_bot ? 'MODEL' : 'USER'
      { role: role, parts: { text: msg.to_s } }
    }
  end

  def should_respond_with_gemini?
    # I need 1+ message, and the last should NOT be from a bot,m or i risk recursion
    return false if messages.size < 1
    messages_for_gemini.last[:role] != 'MODEL' rescue false
  end


end
