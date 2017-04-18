require 'test_helper'

class EntryTest < ActiveSupport::TestCase

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

      admin = FactoryGirl.build :admin
      entry = FactoryGirl.build(:entry, admin: admin, 
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
      should 'not be too large' do
        # This test file is ~10MB, which is too large
        invalid_image = File.new(Rails.root.join('test/files/invalid_image_size.jpeg'))
        entry = FactoryGirl.build :entry, image: invalid_image

        refute entry.valid?
        assert entry.errors.full_messages.include?("Image file size must be in between 0 Bytes and 5 MB")
      end

      should 'only be of preferred content_types' do
        invalid_image = File.new(Rails.root.join('test/files/invalid_file_type.txt'))
        entry = FactoryGirl.build :entry, image: invalid_image

        refute entry.valid?
        assert entry.errors.full_messages.include?("Image content type is invalid")
      end

      should 'not break Entries when valid' do
        valid_image = File.new(Rails.root.join('test/files/valid_image.jpeg'))
        entry = FactoryGirl.build :entry, image: valid_image

        assert entry.valid?
      end
    end
  end

  should 'destroy associated images correctly' do
    valid_image = File.new(Rails.root.join('test/files/valid_image.jpeg'))
    entry = FactoryGirl.create :entry, image: valid_image
    entry.save!

    # Grab the actual url, removing everything after the extension
    image_url = entry.image.url.gsub(/\?(.+)$/, '')
    image_url = Rails.root.join("public/#{image_url}")

    assert File.exist?(image_url)
    entry.destroy!

    assert entry.frozen?
    refute File.exist?(image_url)
  end

  should 'have an author' do
    admin = FactoryGirl.create :admin
    entry = FactoryGirl.create :entry, admin: admin
    assert_equal admin.name, entry.author

    entry.admin = nil
    assert_equal 'Anonymous', entry.author
  end
end
