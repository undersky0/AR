class Imageserver
  
  BASE_URI = 'http://vcache.arnoldclark.com/imageserver' #<obfuscated-stock-reference>/<size>/<camera>
  CAMERA_ANGLE = ['f','i','r','4','5','6']
  IMAGE_SIZE = ['350', '800']
  
  def self.search(stock_ref, plate_reg)
    image = Image.new(stock_ref:stock_ref, plate_reg:plate_reg)
    if Image.where(stock_ref:stock_ref,plate_rag:plate_reg).nil?
      return 0 # Image.where would only be necessary if db actually stored any images
    else
      if image.valid? # not sure if this is approapriate, but it makes it really easy to call validations
        return url(stock_ref,plate_reg)
      else
        return image
      end
    end
  end
  
  private
  
  def self.url(stock_ref,plate_reg)
     images = []
      IMAGE_SIZE.each do |size|
         CAMERA_ANGLE.each do |camera|
           ob = obfuscated_key(stock_ref,plate_reg)
           url = "#{BASE_URI}/#{ob}/#{size}/#{camera}"
           image = Image.new(stock_ref:stock_ref, plate_reg:plate_reg, camera_angle:camera, image_size:size, obfuscated: ob, url:url) 
           images << image
         end
      end
      return images
  end
  
  def self.obfuscated_key(stock_ref,plate_reg)
    Digest::SHA1.hexdigest("#{stock_ref}-#{plate_reg}")
  end
  
end