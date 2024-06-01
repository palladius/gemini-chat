class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  # TODO also add to user as facebook-like notification...
  after_create_commit { broadcast_append_to self.room }

end
