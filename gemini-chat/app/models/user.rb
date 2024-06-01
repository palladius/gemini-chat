class User < ApplicationRecord
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  scope :all_except, ->(user) { where.not(id: user) }

end
