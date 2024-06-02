

APP_NAME = ENV.fetch 'APP_NAME', 'GemiNews'
EmojiAppName = "♊️ GeminiChat 💬"
APP_VERSION = `cat ./VERSION`.chomp rescue "ERROR: #{$!}"
# Note this is NOT necessary to run GCP, its just ONE way.
GAC = ENV.fetch 'GOOGLE_APPLICATION_CREDENTIALS', nil
GOOGLE_APPLICATION_CREDENTIALS  = ENV.fetch 'GOOGLE_APPLICATION_CREDENTIALS', nil
EmbeddingEmoji = '🗿'

AppUrlDev  = 'https://gemini-news-crawler-dev-x42ijqglgq-ew.a.run.app/'
AppUrlProd = 'https://gemini-news-crawler-prod-x42ijqglgq-ew.a.run.app/'

# https://cloud.google.com/run/docs/container-contract#env-vars
CloudRunJob = ENV.fetch 'CLOUD_RUN_JOB', nil
IsCloudRun = !!CloudRunJob

emoji = '♊️💬'
# 🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡🧡
puts "#{emoji} #{ emoji * 30}"

puts "#{emoji} Welcome to #{APP_NAME} v#{APP_VERSION}"
puts "#{emoji} To check that DB is fine, let me paste a few 🕵️‍♂️ SECRET things:"
# Secret stuff
%w{ DATABASE_URL_DEV DATABASE_URL_PROD RAILS_MASTER_KEY NEWSAPI_COM_KEY GEMINI_KEY GCP_KEY_PATH}.sort.each do |env_key|
  puts "#{emoji} 🕵️‍♂️ ENV[#{env_key}]: #{ ENV.fetch( env_key, '🤷' ).first 5}... (size: #{ENV.fetch( env_key, '🤷' ).size})"
end
puts "#{emoji} .. which is why I only show the top N chars. Note that Gemini and NewsAPI keys are useless so far.."
# Public stuff
puts "#{emoji}"
puts "#{emoji} And now the 🌞 PUBLIC stuff:"
puts "#{emoji} 🌞 Rails.env: #{Rails.env}"
%w{ APP_NAME SKAFFOLD_DEFAULT_REPO  MESSAGGIO_OCCASIONALE RAILS_ENV }.sort.each do |env_key|
  puts "#{emoji} 🌞 ENV[#{env_key}]: #{ ENV.fetch( env_key, '🤷' )}"
end
# Now normal variables..
puts "#{emoji} 🧊 REDIS_IP:        #{ENV['REDIS_IP']}"
puts "#{emoji} 🧊 REDIS_REGION:    #{ENV['REDIS_REGION']}"
puts "#{emoji} 🧊 REDIS_URL:       '#{ENV['REDIS_URL']}' (what I use here - should be prod one only in Clourd Run)"
puts "#{emoji} 🧊 RICCARDO_REDIS_URL: '#{ENV['RICCARDO_REDIS_URL'] }' (prod one)"
puts "#{emoji} ☁️ CloudRunJob: #{CloudRunJob}"
puts "#{emoji} ☁️ IsCloudRun:  #{IsCloudRun}"

#puts "#{emoji} 🌞 GCP_KEY_PATH:           #{GCP_KEY_PATH}"
#puts "#{emoji} 🌞 GCP_KEY_PATH_EXISTS:    #{GCP_KEY_PATH_EXISTS}"
#puts "#{emoji} 🌞 CLOUDRUN_SA_KEY_EXISTS: #{CLOUDRUN_SA_KEY_EXISTS}" # should only exist in ricc cloud run. For debug
#puts "#{emoji} 🌞 CLOUDRUN_ENVRC_EXISTS:  #{CLOUDRUN_ENVRC_EXISTS}"
#puts "#{emoji} 🌞 GOOGLE_APPLICATION_CREDENTIALS:  #{GOOGLE_APPLICATION_CREDENTIALS}"


puts "#{emoji} #{ emoji * 60}"









Rails.application.configure do
  config.hosts << "gemini-chat-dev-x42ijqglgq-ew.a.run.app"
  config.hosts << /.*\.proxy\.googleprod\.com/
  config.hosts << /gemini-chat.*\.run\.app/
  config.hosts << "localhost:3000"
  config.hosts << "localhost"
  config.hosts << "localhost:3001"
  config.hosts << "localhost:8080"
  # Skip DNS rebinding protection for the default health check endpoint.
  #config.host_authorization = { exclude: ->(request) { request.path == "/up" } }
  #config.host_authorization = { exclude: ->(request) { request.path == "/statusz" } }

  # Disable AR logging for super long thingy: https://stackoverflow.com/questions/13051949/how-to-disable-activerecord-logging-for-a-certain-column
  # config.filter_parameters << :title_embedding
  # config.filter_parameters << :article_embedding
  # config.filter_parameters << :summary_embedding
end
