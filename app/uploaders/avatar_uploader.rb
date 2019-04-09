class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_limit => [300,300]
  end

  version :image do
    process :resize_to_limit => [400,400]
  end

  version :profile do
    process :resize_to_limit => [32,32]
  end

end
