

generate:
	rails g model User username email description
	rails g model Room name:string description:string is_private:boolean is_active:boolean has_bot:boolean
	# types: user2llm, llm2user, func_call
	rails g model Message user:references room:references type:string content:text internal_stuff:text
	rails g model Participant user:references room:references is_bot:boolean description:string

clean:
	rails tmp:clear
dev:
	rails assets:precompile
	rails s -p 8081

credentials-edit: credentials-edit-dev

credentials-edit-dev:
	EDITOR="code --wait" bin/rails credentials:edit

credentials-edit-prod:
	EDITOR="code --wait" RAILS_ENV=production rails credentials:edit

test-db:
	echo Room.count | rails c
	echo User.count | rails c
