

emoji = '♊️💬'
# ♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬♊️💬
puts "#{emoji} #{ emoji * 30}"

puts "#{emoji} Welcome to #{APP_NAME} v#{APP_VERSION}"
puts "#{emoji} To check that DB is fine, let me paste a few 🕵️‍♂️ SECRET things:"
# Secret stuff
%w{ DATABASE_URL_DEV DATABASE_URL_PROD RAILS_MASTER_KEY GEMINI_KEY }.sort.each do |env_key|
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
# redis cmd
puts "#{emoji} 🧊 REDIS_IP:        #{ENV['REDIS_IP']}"
puts "#{emoji} 🧊 REDIS_REGION:    #{ENV['REDIS_REGION']}"
puts "#{emoji} 🧊 REDIS_URL:       '#{ENV['REDIS_URL']}' (what I use here - should be prod one only in Clourd Run)"
puts "#{emoji} 🧊 RICCARDO_REDIS_URL: '#{ENV['RICCARDO_REDIS_URL'] }' (prod one)"
puts "#{emoji} ☁️ CloudRunJob: #{CloudRunJob}"
puts "#{emoji} ☁️ IsCloudRun:  #{IsCloudRun}"
puts "#{emoji} ☁️ redis cmd on GCE: redis-cli -h #{ENV['REDIS_IP']} -p 6379"

#puts "#{emoji} 🌞 GCP_KEY_PATH:           #{GCP_KEY_PATH}"
#puts "#{emoji} 🌞 GCP_KEY_PATH_EXISTS:    #{GCP_KEY_PATH_EXISTS}"
#puts "#{emoji} 🌞 CLOUDRUN_SA_KEY_EXISTS: #{CLOUDRUN_SA_KEY_EXISTS}" # should only exist in ricc cloud run. For debug
#puts "#{emoji} 🌞 CLOUDRUN_ENVRC_EXISTS:  #{CLOUDRUN_ENVRC_EXISTS}"
#puts "#{emoji} 🌞 GOOGLE_APPLICATION_CREDENTIALS:  #{GOOGLE_APPLICATION_CREDENTIALS}"

puts "#{emoji} #{ emoji * 60}"
