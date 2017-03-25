require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  context 'validations' do
    should 'require a username'
    should 'require username be unique'
    should 'require a first_name and last_name'
  end
end
