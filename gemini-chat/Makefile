

generate:
	rails g model User username email description
	rails g model Room name:string description:string is_private:boolean is_active:boolean has_bot:boolean

dev:
	rails s -p 8081

test-db:
	echo Room.count | rails c
	echo User.count | rails c
