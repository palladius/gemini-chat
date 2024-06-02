###########################################################################
# This carlessian file sets up ENV and other Global envs
###########################################################################

APP_NAME = ENV.fetch 'APP_NAME', 'GemiNews'
EmojiAppName = "♊️ GeminiChat 💬"
APP_VERSION = `cat ./VERSION`.chomp rescue "ERROR: #{$!}"
# Note this is NOT necessary to run GCP, its just ONE way.
GAC = ENV.fetch 'GOOGLE_APPLICATION_CREDENTIALS', nil
GOOGLE_APPLICATION_CREDENTIALS  = ENV.fetch 'GOOGLE_APPLICATION_CREDENTIALS', nil
EmbeddingEmoji = '🗿'

AppUrlDev  = 'https://gemini-chat-dev-x42ijqglgq-ew.a.run.app/'
AppUrlProd = 'https://gemini-chat-prod-x42ijqglgq-ew.a.run.app/'

# https://cloud.google.com/run/docs/container-contract#env-vars
CloudRunJob = ENV.fetch 'CLOUD_RUN_JOB', nil
IsCloudRun = !!CloudRunJob

DATABASE_URL_DEV = Rails.application.credentials.env[:DATABASE_URL_DEV] rescue nil
DATABASE_URL_PROD = Rails.application.credentials.env[:DATABASE_URL_PROD] rescue nil
