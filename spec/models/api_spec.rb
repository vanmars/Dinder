require 'rails_helper'

describe Api do
  it { should validate_presence_of :sender_id}
  it { should validate_presence_of :json }
end