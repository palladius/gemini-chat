

generate:
	rails g model User username email description
	rails g model Room name:string description:string is_private:boolean is_active:boolean has_bot:boolean
	# types: user2llm, llm2user, func_call
	rails g model Message user:references room:references type:string content:text internal_stuff:text
	rails g model Participant user:references room:references is_bot:boolean description:string

clean:
	rails tmp:clear
# It only works with HTTP:// not HTTPS, chrome complains
dev:
	rails assets:precompile
	rails s -p 8081 -b 0.0.0.0
prod:
	RAILS_ENV=production rails assets:precompile
	RAILS_ENV=production rails db:migrate
	RAILS_ENV=production rails db:seed
	RAILS_ENV=production bin/docker-entrypoint rails s -p 8080 -b 0.0.0.0

credentials-edit: credentials-edit-dev

credentials-edit-dev:
	EDITOR="code --wait" bin/rails credentials:edit

credentials-edit-prod:
	EDITOR="code --wait" RAILS_ENV=production rails credentials:edit

test-db:
	echo Room.count | rails c
	echo User.count | rails c

db-drop-YES-I_AM_SURE:
	rake db:drop
	rake db:migrate db:seed

gemini-respond-in-prod:
	echo Room.gemini_reply_all | RAILS_ENV=production rails c
