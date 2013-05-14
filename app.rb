require 'sinatra'

Cloudinary.config do |config|
  config.cloud_name    = 'eightsevennorth'
  config.api_key       = '354586816237512'
  config.api_secret    = 'M14l_3FNJgSOw6BBltrwTFsuV08'
  config.cdn_subdomain = true
end

get '/' do
  erb :index
end