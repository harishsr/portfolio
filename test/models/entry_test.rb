require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  setup do
    @admin = FactoryGirl.create :admin
  end

  context 'validations' do
    should 'invalidate invalid objects' do
      entry = Entry.new
      expected_errors = ["Admin must exist", "Title can't be blank", "Title is too short (minimum is 3 characters)", 
                         "Content can't be blank", "Content is too short (minimum is 3 characters)"]

      refute entry.valid?
      expected_errors.each do |error|
        assert entry.errors.full_messages.include?(error), error
      end
    end

    should 'require title and content fall within required lengths' do
      title_max_length = 200
      content_max_length = Entry::CONTENT_LENGTH_MAX
      expected_errors = ["Title is too long (maximum is #{title_max_length} characters)", 
                         "Content is too long (maximum is #{content_max_length} characters)"]

      entry = FactoryGirl.build(:entry, admin: @admin, 
        title: 'a' * (title_max_length + 1),
        content: 'a' * (content_max_length + 1))

      refute entry.valid?
      expected_errors.each do |error|
        assert entry.errors.full_messages.include?(error), error
      end
    end

    should 'create a valid object' do
      entry = FactoryGirl.build(:entry)
      assert entry.valid?
    end

    context 'that images' do
      should 'not be too large'
      should 'only be of preferred content_types'
      should 'not break Entries'
    end
  end
end
