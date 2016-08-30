# config/initializers/paperclip.rb
Paperclip::Attachment.default_options[:url] = ':s3.eu-central-1.amazonaws.com/wiadro24'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
