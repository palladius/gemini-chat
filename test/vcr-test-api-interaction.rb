

require 'gemini-ai'
require 'vcr'

# Configure VCR
VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
end

# Configure Gemini (replace with your actual configuration)
GeminiAi.configure do |config|
  config.api_key = ENV['GEMINI_API_KEY'] 
end

RSpec.describe "Gemini API interaction", :vcr do
  it "records and replays the interaction" do
    VCR.use_cassette("gemini_chat") do
      response = Gemini.chat('Why is the sky blue?')
      expect(response.text).to include("Rayleigh scattering") # Example assertion
    end
  end
end

# Generated with Gemini so test it first

