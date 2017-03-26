require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  context 'validations' do
    should 'require a title and content'
    should 'require title and content fall within required lengths'
    should 'belong to an admin'

    should 'create a valid object'
  end
end
