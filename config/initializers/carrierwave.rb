CarrierWave.configure do |config|
      config.fog_credentials = {
        :provider              => 'AWS',
        :aws_access_key_id     => ENV['S3_KEY'],
        :aws_secret_access_key => ENV['S3_SECRET'],
        :region                => ENV['S3_REGION']
       }

      # For testing, upload files to local `tmp` folder.
      if Rails.env.test? || Rails.env.cucumber?
        config.storage = :file
        config.enable_processing = false
        config.root = "#{Rails.root}/tmp"
      else
        config.storage = :fog
      end

      config.cache_dir = "#{Rails.root}/tmp/uploads"
      config.fog_public     = false                  # To let CarrierWave work on heroku
      config.fog_directory    = ENV['S3_BUCKET_NAME']
      # 이미지를 가진 게시글 삭제 시 AWS S3서버에도 자동 삭제처리
      config.remove_previously_stored_files_after_update = true
    end
