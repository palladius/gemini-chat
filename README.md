
Creating my first chat with Gemini

Self:

* **v1**: learning from my friend Abiodun Olowode
https://www.honeybadger.io/blog/chat-app-rails-actioncable-turbo/
* **v2**: https://www.youtube.com/watch?v=UvTLumcEMgU using rails7 and `electron`.

## Config

* rails 7.1.3.3
* ruby 3.something (moving from 3.1 to 3.3 for some local Mac allucinations)
* using `redis` on GCP and rocking it (see `config/initializers/` monkeypatching for GCP)

## About

This app works this way:
* You launch a Gemini job which polls all chats every 2 seconds: `echo GeminiRoomReplyForeverJob.perform_now | RAILS_ENV=production rails c`
* Then you talk to haunted rooms (see a 👻 beside room name). If not haunted, you can specify you wanna talk to Gemini by just saying "@gemini <your question>".

As simple as that - pretty sweet!

## PROD

Note Ricc: you need to install a Redis too, probably, for Turbo to work.

To productionize I had to - on GCP:

1. Create CB trigger. TODO dump logic here.
     1. Add to it the RAILS_MASTER_KEY. Trying to dry stuff so thats the only secret i put in the cloud. Everything else is encrypted here.
2. Connect Cloud Build to my github repo: https://console.cloud.google.com/cloud-build/triggers;region=global/edit/ba96c5f0-d059-47ef-88f2-5b392a8425f1?e=-13802955&project=palladius-genai
3. Created AR: https://console.cloud.google.com/artifacts/docker/palladius-genai/europe-west1/gemini-chat?project=palladius-genai
4. Maybe also customized SvcAcct?
5. Created secret: `projects/272932496670/secrets/gemini-chat-envrc`.
