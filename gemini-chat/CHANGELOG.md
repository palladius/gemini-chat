
Taking this tutorial: https://www.honeybadger.io/blog/chat-app-rails-actioncable-turbo/

```
2024-06-16 0.5.15 [dev] Added Pages/about and GEMINI_REPLY_JOB_VERBOSE which should launch this in prod automatically
  # added branch for 90% done work: https://github.com/palladius/gemini-chat/tree/devise-broken
2024-06-04 0.5.14 [dev] Added super duper functionality. Now Gemini responds to '@gemini' questions :)
2024-06-04 0.5.13 [ops] Created a Gemini::ReplyAll job to do it forever.
2024-06-02 0.5.12 [ops] Try to move PG credentials from locally encrypted to ENV+SecretMgr.. damn.
2024-06-02 0.5.11 Small Mac bugfix + Room gemini functionality BAD bugfix. Now it works again!
2024-06-02 0.5.10 Moving PROD to PostgreS!!! Took me less than 5min in localhost - wow. God bless RAC! With ENV it would have taken me MUCH more (change CB, Secrets, build script, ..)
2024-06-02 0.5.9 adding link to message in chat to troubleshoot stuff.
2024-06-02 0.5.8 better chat again
2024-06-02 0.5.7 adding redcarpet. Plkius fixing the config/init/ricc_70_llm bug.
2024-06-02 0.5.6 fixing dockerfile maybe?
2024-06-02 0.5.5 Moving/trying to move to ruby `3.3`
2024-06-02 0.5.5 and here i try to enable Gemini autoresponder!
2024-06-02 0.5.4 I have a feeling that this new auto-response doesnt work, and breaks JS automation.
2024-06-02 0.5.3 Adding Gemini support, finally.
2024-06-02 0.5.2 added version to footer, finally
2024-06-02 0.5.1 fixed colors: blue green like Apple + gray for robot.
2024-06-02 0.5.0 fixed TYPE and adding is_bot to users so I can create Gemini bot.
2024-06-02 0.4.12 good old header and footer
2024-06-02 0.4.11 This should fix GCP https://stackoverflow.com/questions/76017196/ruby-on-rails-action-cable-sidekiq-with-gcp-memorystore-redis-client-command-n
2024-06-02 0.4.10 deniugging a balus and a new bug. msgs are now tripled!
2024-06-02 0.4.9 moving to port 8080
2024-06-02 0.4.8 [ops] Trying really hard to fix ENV stuff for redis.
2024-06-02 0.4.7 [ops] Adding Redis to GCP and finding out the IP address
2024-06-02 0.4.6 [ops] Added secret - not stritcly needed but better to add it than make the oeffort of scraping it out and maybe someday i need it.
2024-06-02 0.4.5 [dev] nicer view nuvolette..
                 [ops] moving autotag and build script one folder below so its centered in RAILS_ROOT
2024-06-02 0.4.4 [ops] added autotag
2024-06-02 0.4.3 [dev] finished Abi tutorial
2024-06-02 0.4.2 [ops] Adding cloud build and ENVs and secrets.
2024-06-02 0.4.1 refine Participants
2024-06-02 0.4.0 added Participants
2024-06-01 0.3.0 messages added ands it woerks WOW
2024-06-01 0.2.1 adding seeds and introducing Turbo and Redis
2024-06-01 0.2.0 Added `rooms`
2024-06-01 0.1.0 Added users
```
