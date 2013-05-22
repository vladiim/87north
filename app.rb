require 'sinatra'
require 'cloudinary'

Cloudinary.config do |config|
  config.cloud_name    = ENV['87_COUDINARY_CLOUD_NAME']
  config.api_key       = ENV['87_CLOUDINARY_API_KEY']
  config.api_secret    = ENV['87_CLOUDINARY_API_SECRET']
  config.cdn_subdomain = true
end

get '/' do
  erb :index
end