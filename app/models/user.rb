class User < ApplicationRecord
  include Clearance::User

  has_many :events
  
  has_many :memberships
  has_many :groups, through: :memberships
end
