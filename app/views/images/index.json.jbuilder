json.array!(@images) do |image|
  json.extract! image, :id, :image_size, :camera_angle, :stock_ref, :plate_reg, :obfuscated, :url
  json.url image_url(image, format: :json)
end
