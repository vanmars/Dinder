require 'rails_helper'

describe ApiUser do
  it { should validate_presence_of :user_id }
end