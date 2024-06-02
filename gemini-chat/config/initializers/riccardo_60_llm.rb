
# # Should be Gemini - note this has been renamed from GoogleVertexAI to GoogleVertexAI in 0.13 version
VertexLLM = Langchain::LLM::GoogleVertexAI.new(project_id: ENV['PROJECT_ID'], region: 'us-central1') rescue "VertexLLM Error('#{$!}')"
# # VertexLLM.chat messages: 'Ciao come stai?' -> {"error":"invalid_scope","error_description":"Invalid OAuth scope or ID token audience provided."}
gemini_llm_key = Rails.application.credentials.env.GEMINI_API_KEY_BIG_QUOTA rescue 'nisba'
GeminiLLM = Langchain::LLM::GoogleGemini.new(api_key: gemini_llm_key) rescue nil # 9xhQ
# Requires `google_palm_api`. USes old model "text-bison-001", but it works.
PalmLLM = Langchain::LLM::GooglePalm.new(api_key: ENV['PALM_API_KEY_GEMINI'],
  default_options: {
    completion_model_name: "text-bison-001",
    embeddings_model_name: "embedding-gecko-001", # newer
    temperature: 0.2,
  }) rescue nil
OllamaLLM = Langchain::LLM::Ollama.new rescue nil

# https://ai.google.dev/palm_docs/palm?hl=en
PalmLLMImpromptu = PalmLLM.nil? ?
  '🤌 I cant, PalmLLM is nil 🤌' :
  PalmLLM.complete(prompt: 'Are you a Palm model? If so, please tell me: your model name, your cut off time (meaning - whats the most recent memory you have?), and input/output token limit')


#   # In order
LLMs = [VertexLLM, GeminiLLM, PalmLLM, OllamaLLM ]


# GeminiAuthenticated = (GeminiLLM.authenticated? rescue "Error: #{$!}") # false # doesnt work GeminiLLM.authorizer.refresh_token.match? /^1\/\// # Vertex auth is ok
# GeminiApiKeyLength = GeminiLLM.api_key.to_s.length rescue (-1)

# # This code is created by ricc patching manually langchain...
# GeminiLLMAuthenticated = GeminiLLM.authenticated? rescue "UnImplemented - Probably Derek Only but things are moving since v0.3.23. Error: #{$!}"
# VertexLLMAuthenticated = VertexLLM.authenticated? rescue "UnImplemented - Probably Derek Only but things are moving since v0.3.23. Error: #{$!}"


# VertexAuthenticated = !!(VertexLLM.authorizer.fetch_access_token rescue false)
# VertexAuthTokenLength = VertexLLM.authorizer.fetch_access_token['access_token'].to_s.length rescue (-1)  # => 1024
# # This doesnt make sense: only works if its already authenticated
# # VertexAuthenticatedAlready = !!(VertexLLM.authorizer.refresh_token.to_s.match?(/^1\/\//) rescue false) # Vertex auth is ok

# BookOfLLMs = {
#   vertex: {
#     llm: VertexLLM.class,
#     description: 'This is the only HIGH QPS I have but unfortunately I seem to be able to only use it for embeddings. which is great, since theyre the only thing i do at big scale. But then it breaks my demo if I ask more than 5 request per minute (5QPM)',
#     auth_method: 'GCP (high QPS)',
#     #authenticated1: VertexAuthenticated,
#     #authenticated2: VertexLLMAuthenticated,
#   },
#   gemini: {
#     llm: GeminiLLM.class,
#     description: 'todo',
#     auth_method: 'api_key (low QPS)',
#     authenticated1: GeminiAuthenticated, # <== this gives an error
#     authenticated_should_work_without_exception_now: GeminiLLM.authenticated?,
#   },
#   palm: {
#     llm: PalmLLM.class,
#     description: 'todo',
#     auth_method: 'api_key (low QPS)',
#     #authenticated: PalmLLM.authenticated?,
#   },
#   ollama: {
#     llm: OllamaLLM.class,
#     description: 'not used ANYWHERE for now',
#     #auth_method: 'api_key (low QPS)',
#     #authenticated: PalmLLM.authenticated?,
#   }
# }
