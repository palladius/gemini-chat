
Creating my first chat with Gemini

* v1: learnign from my friend Abi
https://www.honeybadger.io/blog/chat-app-rails-actioncable-turbo/
 * v2: https://www.youtube.com/watch?v=UvTLumcEMgU using rails7 and `electron`.

## PROD

Note Ricc: you need to install a Redis too, probably, for Turbo to work.

To productionize I had to - on GCP:

1. Create CB trigger. TODO dump logic here.
     1. Add to it the RAILS_MASTER_KEY. Trying to dry stuff so thats the only secret i put in the cloud. Everything else is encrypted here.
2. Create AR?
3. Connect Cloud Build to my github repo: https://console.cloud.google.com/cloud-build/triggers;region=global/edit/ba96c5f0-d059-47ef-88f2-5b392a8425f1?e=-13802955&project=palladius-genai
