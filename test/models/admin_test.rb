require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  context 'validations' do
    should 'invalidate invalid objects' do
      admin = Admin.new
      expected_errors = ["Email can't be blank", "Password can't be blank", "Username can't be blank", 
                         "Username is too short (minimum is 6 characters)", "First name can't be blank", 
                         "First name is too short (minimum is 2 characters)", "Last name can't be blank", 
                         "Last name is too short (minimum is 2 characters)"]

      refute admin.valid?
      expected_errors.each do |error|
        assert admin.errors.full_messages.include?(error), error
      end
    end

    should 'require username be unique' do
      admin = FactoryGirl.create :admin
      admin2 = FactoryGirl.build :admin, username: admin.username

      refute admin2.valid?
    end

    should 'create a valid Admin' do
      admin = FactoryGirl.build :admin
      assert admin.valid?
    end
  end

  should 'have a full name' do
    admin = FactoryGirl.create :admin, first_name: "Gandalf", last_name: "the Gray"
    assert_equal "Gandalf the Gray", admin.name
  end
end
