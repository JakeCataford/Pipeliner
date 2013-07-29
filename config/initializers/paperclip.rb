
unless Rails.env.development?
  Pipeliner::Application.config.paperclip_defaults = {
    :storage => :s3,
    :s3_credentials => {
      :bucket => ENV['AWS_BUCKET'],
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
  }

  Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
end

#Paperclip::Attachment.default_options[:path] = '/tmp/:class/:attachment/:id_partition/:style/:filename'