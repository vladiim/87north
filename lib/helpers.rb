def upload(filename)
  Cloudinary::Uploader.upload("#{Dir.pwd}/public/images/#{filename}")
end