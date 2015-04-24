require 'sinatra'
require 'cloudinary'
require 'json'
require 'pony'

Dir["#{Dir.pwd}/lib/*.rb"].each { |file| require file }

get '/' do
  @images = Images.new
  erb :index
end

post '/bookings' do
  content_type :json
  BookingCreator.new(params).send_booking!
  { :message => "Booking made!" }.to_json
end