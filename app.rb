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
  @images = Images.new
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
      to: 'evagreg7@gmail.com',
      # to: 'vladiim@yahoo.com.au',
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

class Images
  def approach; "http://res.cloudinary.com/eightsevennorth/image/upload/v1370644889/sahfob2qkltpytth5tfi.jpg"; end
  def beach; "http://res.cloudinary.com/eightsevennorth/image/upload/v1370645023/hggktozmi1s4kgsxmtfr.jpg"; end
  def bedroom; "http://res.cloudinary.com/eightsevennorth/image/upload/v1370645072/gjxoibli9tgc0uhu3xci.jpg"; end
  def deck; "http://res.cloudinary.com/eightsevennorth/image/upload/v1370645116/cw4fsqiqn1i8jjatipdn.jpg"; end
  def hero; "http://res.cloudinary.com/eightsevennorth/image/upload/v1370645163/uycqimtj2uow6rflgzop.jpg"; end
  def kitchen; "http://res.cloudinary.com/eightsevennorth/image/upload/v1370645198/cihvebtred2edqmtc3nb.jpg"; end
  def living; "http://res.cloudinary.com/eightsevennorth/image/upload/v1370645235/jjduvrjmpkuun9doxtlg.jpg"; end
  def outdoor_dining; "http://res.cloudinary.com/eightsevennorth/image/upload/v1370645270/g8xqg3tynk0ujaelutls.jpg"; end
  def recliner; "http://res.cloudinary.com/eightsevennorth/image/upload/v1370645319/q2nyoxqcot3qra9hvzsw.jpg"; end
  def take_a_break; "http://res.cloudinary.com/eightsevennorth/image/upload/v1370645348/zwt33ur8oqmbawtpqqbf.png"; end
  def blank; "http://res.cloudinary.com/eightsevennorth/image/upload/v1370647657/gllhyg68ngs2tqebhqqg.gif"; end
  def fancy_box_loading; "http://res.cloudinary.com/eightsevennorth/image/upload/v1370647714/makmp45upcxp9voksel3.gif"; end
  def fancy_box_sprite; "http://res.cloudinary.com/eightsevennorth/image/upload/v1370647772/ianfzalykxuynw5evtbv.png"; end
  def fancy_box_overlay; "http://res.cloudinary.com/eightsevennorth/image/upload/v1370647833/xkgwpjoodfftg4sozyp7.png"; end
end