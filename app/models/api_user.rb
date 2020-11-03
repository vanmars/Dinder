class ApiUser < ApplicationRecord
  belongs_to :api
  belongs_to :user

  validates :user_id, presence: true
end