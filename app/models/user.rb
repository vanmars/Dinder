class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar 
  
  has_many :messages, foreign_key: :sender_id
  has_many :apis, foreign_key: :sender_id
  has_many :winders
  has_many :matches
  # has_many :matches, foreign_key: :sender_id
  

  has_and_belongs_to_many :friends,
                          class_name: "User",
                          join_table: :friendships,
                          foreign_key: :user_id,
                          association_foreign_key: :friend_user_id

  has_and_belongs_to_many :friend_requests,
                          class_name: "User",
                          join_table: :friend_requests,
                          foreign_key: :user_id,
                          association_foreign_key: :friend_user_id

  scope :friend_search, -> (friend_parameter) { where("name ilike ?", "%#{friend_parameter}%") }

end
