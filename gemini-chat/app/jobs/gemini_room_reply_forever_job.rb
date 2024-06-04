# bin/rails generate job guests_cleanup
# from: https://guides.rubyonrails.org/active_job_basics.html
# Adapter:
# Now: Rails.application.config.active_job.queue_adapter
# => :async
# Better to use other stuff.

class GeminiRoomReplyForeverJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    #sleep_time ||= args[:sleep_time]
     while true
      puts "⏳♊️ Gemini ReplyAll 4ever: #{Time.now}"
      Room.gemini_reply_all
      sleep 3
    end
  end
end
