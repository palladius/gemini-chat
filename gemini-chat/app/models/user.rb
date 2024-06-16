class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_uniqueness_of :username, allow_nil: true
  validates_uniqueness_of :email, allow_nil: true
  scope :all_except, ->(user) { where.not(id: user) }

  # ActionCable
  after_create_commit { broadcast_append_to "users" }
  has_many :messages
  before_save :add_fake_username_if_needed

  def admin?
    false
  end

  def message_box_class
    is_bot? ? 'message-box-bot' : 'message-box-person'
  end

  def emoji = is_bot? ? '🤖' : '🤷‍♂️'

  def to_s =  "#{self.emoji} #{self.username}"

  def add_fake_username_if_needed
    unless self.username.present?
      self.username = self.email.gsub('@','_')
    end
  end

  def self.cernita(header: true)
    users = User.all.map{|u| [u.id, u.username, u.email,  u.encrypted_password.to_s.size, u.valid?]}
    users.unshift(%w{id username email encrypted_pwd_size valid?}) if header
    users
  end

  def self.fix_old_users
    User.where(email: nil).each do |user|
      user.email = user.username + '@migrated.example.com'
      user.save
    end
  end
end
