if Rails.env.production?
  Paperclip::Attachment.default_options[:storage] = :fog
  Paperclip::Attachment.default_options[:fog_credentials] = { 
    provider: 'AWS', 
    region: ENV['AWS_REGION'],
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  }
  Paperclip::Attachment.default_options[:fog_directory] = ENV['AWS_S3_BUCKET']
  # Paperclip::Attachment.default_options[:fog_host] = "http://localhost:3000"
end
