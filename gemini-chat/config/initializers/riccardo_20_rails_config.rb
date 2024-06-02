

# this works: http://localhost:8081/rooms/10

Rails.application.configure do
  config.hosts << "gemini-chat-dev-x42ijqglgq-ew.a.run.app"
  config.hosts << /.*\.proxy\.googleprod\.com/
  config.hosts << /gemini-chat.*\.run\.app/
  config.hosts << "localhost:3000"
  config.hosts << "localhost"
  config.hosts << "127.0.0.1"
#  config.hosts << "localhost:3001"
  config.hosts << "localhost:8081"
  config.hosts << '127.0.0.1:8081'
  config.hosts << "localhost:8080"
  config.hosts << '127.0.0.1:8080'
  # Skip DNS rebinding protection for the default health check endpoint.
  config.host_authorization = { exclude: ->(request) { request.path == "/up" } }
  config.host_authorization = { exclude: ->(request) { request.path == "/statusz" } }

  # Yup, even in prod! https://stackoverflow.com/questions/42750685/http-parse-error-malformed-request-ruby-on-rails
  config.force_ssl = false

  # Disable AR logging for super long thingy: https://stackoverflow.com/questions/13051949/how-to-disable-activerecord-logging-for-a-certain-column
  # config.filter_parameters << :title_embedding
  # config.filter_parameters << :article_embedding
  # config.filter_parameters << :summary_embedding
end
