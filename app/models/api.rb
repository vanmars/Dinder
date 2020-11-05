class Api < ApplicationRecord
 belongs_to :sender, class_name: "User"
 has_many :api_users
 has_many :users, :through => :api_users

#  validates :sender_id, presence: true
#  validates :json, presence: true

 has_many :winders
end
