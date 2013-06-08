def upload_image(filename)
  upload(filename, 'images')
end

def upload(filename, type)
  Cloudinary::Uploader.upload("#{Dir.pwd}/public/#{type}/#{filename}")
end