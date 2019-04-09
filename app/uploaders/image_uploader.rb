class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # 자료 저장방식 (AWS 연동은 'fog'로, 로컬 저장방식은 'file'로)
  # storage :file
  storage :fog

  # AWS S3 Bucket 저장 경로
  # 이미지가 동일한 경로에 저장되면 똑같은 이름의 이미지가 업로드 할 시 덮어씌어질 수 있어서 이미지가 새로 추가될 때 서로 다른 경로에 이미지가 생성되게 함.
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_limit => [300,300]
  end

  version :show do
    process :resize_to_limit => [400,400]
  end

  def extension_whitelist
      %w(jpg jpeg gif png)
  end


  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
