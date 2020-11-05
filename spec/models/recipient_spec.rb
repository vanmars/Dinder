require 'rails_helper'

describe Recipient do
  it { should validate_presence_of :user_id }
end