class User < ApplicationRecord
  validates_uniqueness_of :username
  validates_uniqueness_of :email, allow_nil: true
  scope :all_except, ->(user) { where.not(id: user) }

  # ActionCable
  after_create_commit { broadcast_append_to "users" }
  has_many :messages

  def admin?
    false
  end

  def message_box_class
    is_bot? ? 'message-box-bot' : 'message-box-person'
  end

  def emoji = is_bot? ? '🤖' : '🤷‍♂️'

  def to_s =  "#{self.emoji} #{self.username}"

end
