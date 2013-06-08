require 'cloudinary'

Cloudinary.config do |config|
  config.cloud_name    = ENV['COUDINARY_CLOUD_NAME_87NORTH']
  config.api_key       = ENV['CLOUDINARY_API_KEY_87NORTH']
  config.api_secret    = ENV['CLOUDINARY_API_SECRET_87NORTH']
  config.cdn_subdomain = true
end