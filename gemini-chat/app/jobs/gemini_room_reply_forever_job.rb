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
    sleep_distance = Rails.env == 'production' ? 2 : 5
    pid = $$ # Process.pid
    verbose = ENV.fetch 'GEMINI_REPLY_JOB_VERBOSE', false # TODO ENV
    puts '⏳' * 80
    puts "⏳♊️ [PID=#{pid}] Gemini ReplyAll 4ever Job v#{job_version} - every #{sleep_distance} seconds: #{Time.now}"
    puts "⏳♊️ [PID=#{pid}] - verbose=#{verbose}"
    puts "⏳♊️ [PID=#{pid}] Bug: it seems like this is caching the room info so it will only update the FIRST time."
    puts '⏳' * 80

    while true
      #puts '⏳' * 80
      puts "⏳⏳⏳ ♊️ [PID=#{pid}] Gemini ReplyAll 4ever Job v#{job_version} - every #{sleep_distance} seconds: #{Time.now}"
      ret = Room.gemini_reply_all(verbose:)
      puts(ret) if verbose
      sleep(sleep_distance)
    end
  end
end
