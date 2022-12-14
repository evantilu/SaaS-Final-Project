class Group < ApplicationRecord
  has_one_attached :avatar
  
  has_many :groupevents
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  def to_param
    groupname
  end

end