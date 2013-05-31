require 'sinatra'
require 'cloudinary'
require 'json'
require 'pony'
require 'debugger'

Cloudinary.config do |config|
  config.cloud_name    = ENV['COUDINARY_CLOUD_NAME_87NORTH']
  config.api_key       = ENV['CLOUDINARY_API_KEY_87NORTH']
  config.api_secret    = ENV['CLOUDINARY_API_SECRET_87NORTH']
  config.cdn_subdomain = true
end

get '/' do
  erb :index
end

post '/bookings' do
  content_type :json
  BookingCreator.new(params).send_booking!
  { :message => "Booking made!" }.to_json
end

class BookingCreator
  attr_accessor :user

  def initialize(user)
  	@user = user
  end

  def send_booking!
    Pony.mail({
      # to: 'evagreg7@gmail.com',
      to: 'vladiim@yahoo.com.au',
      subject: "New 87north Booking!",
      body: "\n Firstname: #{user[:firstname]}\n
             Lastname: #{user[:lastname]}\n
             Email: #{user[:email]}\n
             Number: #{user[:phonenumber]}\n
             Nights: #{user[:nights]}\n
             Start date: #{user[:startdate]}",
      via: :smtp,
      via_options: {
      	address: 'smtp.gmail.com',
      	port: '587',
      	enable_starttls_auto: true,
      	user_name: ENV["GMAIL_USERNAME_87NORTH"],
      	password: ENV["GMAIL_PASSWORD_87NORTH"],
      	authentication: :plain,
      	domain: 'localhost:9292'
      }
    })
  end
end