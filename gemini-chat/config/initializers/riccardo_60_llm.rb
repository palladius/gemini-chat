
# # Should be Gemini - note this has been renamed from GoogleVertexAI to GoogleVertexAI in 0.13 version
VertexLLM = Langchain::LLM::GoogleVertexAI.new(project_id: ENV['PROJECT_ID'], region: 'us-central1') rescue "VertexLLM Error('#{$!}')"
# # VertexLLM.chat messages: 'Ciao come stai?' -> {"error":"invalid_scope","error_description":"Invalid OAuth scope or ID token audience provided."}
gemini_llm_key = Rails.application.credentials.env.GEMINI_API_KEY_BIG_QUOTA rescue 'nisba'
GeminiLLM = Langchain::LLM::GoogleGemini.new(
  api_key: gemini_llm_key,
  default_options: {
    chat_completion_model_name: 'gemini-1.5-flash',
    temperature: 0.2,
  }
) rescue nil # 9xhQ
# Requires `google_palm_api`. USes old model "text-bison-001", but it works.
PalmLLM = Langchain::LLM::GooglePalm.new(api_key: ENV['PALM_API_KEY_GEMINI'],
  default_options: {
    completion_model_name: "text-bison-001",
    embeddings_model_name: "embedding-gecko-001", # newer
    temperature: 0.2,
  }) rescue nil
OllamaLLM = Langchain::LLM::Ollama.new rescue nil
OllamaModel = OllamaLLM.chat_parameters.schema[:model][:default] rescue "OllamaModelError: #{$!}"

# https://ai.google.dev/palm_docs/palm?hl=en
PalmLLMImpromptu = PalmLLM.nil? ?
  '🤌 I cant, PalmLLM is nil 🤌' :
  PalmLLM.complete(prompt: 'Are you a Palm model? If so, please tell me: your model name, your cut off time (meaning - whats the most recent memory you have?), and input/output token limit')


#   # In order
LLMs = [VertexLLM, GeminiLLM, PalmLLM, OllamaLLM ]


# GeminiAuthenticated = (GeminiLLM.authenticated? rescue "Error: #{$!}") # false # doesnt work GeminiLLM.authorizer.refresh_token.match? /^1\/\// # Vertex auth is ok
# GeminiApiKeyLength = GeminiLLM.api_key.to_s.length rescue (-1)

# VertexAuthTokenLength = VertexLLM.authorizer.fetch_access_token['access_token'].to_s.length rescue (-1)  # => 1024
# # This doesnt make sense: only works if its already authenticated
# # VertexAuthenticatedAlready = !!(VertexLLM.authorizer.refresh_token.to_s.match?(/^1\/\//) rescue false) # Vertex auth is ok

BookOfLLMs = {
  vertex: {
    llm: VertexLLM.class,
    description: 'This is the only HIGH QPS I have but unfortunately I seem to be able to only use it for embeddings. which is great, since theyre the only thing i do at big scale. But then it breaks my demo if I ask more than 5 request per minute (5QPM)',
    auth_method: 'GCP (high QPS)',
    tested_for: %w{ embed},
    # VertexLLM.embed text: 'ciao'
  },
  gemini: {
    llm: GeminiLLM.class,
    description: 'todo',
    auth_method: 'api_key (low QPS)',
    tested_for: %w{chat embedding},
    # GeminiLLM.chat messages: { role: 'user', parts: { text: 'hi!' } }
    # GeminiLLM.embed text: 'ciao' # text-embedding-004
  },
  palm: {
    llm: PalmLLM.class,
    description: 'todo',
    auth_method: 'api_key (low QPS)',
    tested_for: %w{complete},
    # PalmLLM.complete(prompt: 'Are you a Palm model?)
  },
  ollama: {
    llm: OllamaLLM.class,
    description: 'Super frigging slow',
    tested_for: %w{summarize},
    # OllamaLLM.summarize text: 'whats 2+2' # model 'llama3'
  }
}

###### Gbaptista instead:
#ENV['GOOGLE_API_KEY'] =  Rails.application.credentials.env.GEMINI_API_KEY_BIG_QUOTA
# This works!
# client = Gemini.new(
#   credentials: {
#     service: 'generative-language-api',
#     api_key: Rails.application.credentials.env.GEMINI_API_KEY_BIG_QUOTA # ENV['GOOGLE_API_KEY']
#   },
#   options: { model: 'gemini-pro', server_sent_events: true }
# )
# result = client.stream_generate_content({
#   contents: { role: 'user', parts: { text: 'hi! How are you? And what day is today?' } }
# })
