# bin/rails generate job guests_cleanup
# from: https://guides.rubyonrails.org/active_job_basics.html
# Adapter:
# Now: Rails.application.config.active_job.queue_adapter
# => :async
# Better to use other stuff.

class GeminiRoomReplyForeverJob < ApplicationJob
  queue_as :default

  # TODO also create the only once job, to test with CRun.
  def perform(*args)
    # Do something later
    #sleep_time ||= args[:sleep_time]
    job_version = '1.0'
    sleep_distance = 3
    pid = $$ # Process.pid
    while true
      puts '⏳' * 80
      puts "⏳♊️ [PID=#{pid}] Gemini ReplyAll 4ever Job v#{job_version} - every #{sleep_distance} seconds: #{Time.now}"
      puts '⏳' * 80
      Room.gemini_reply_all
      sleep(sleep_distance)
    end
  end
end
