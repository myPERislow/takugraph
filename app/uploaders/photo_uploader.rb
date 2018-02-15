class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # ファイルの保存方法(デフォルトはファイル)
  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # 保存パス
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end


  # ファイルのサイズの変換
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

  # indexページにサムネイル、showページに大きな画像を表示したい。
  # アップローダファイルに画像の大きさを表示

  # 横幅を500pxに制限して保存する。

  # showページ(大きな画像)
  process resize_to_limit: [500, nil]
  # indexページ(サムネイル)
  version :thumb do
    process resize_to_fit: [300, nil]
  end

  # 拡張子の変換
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # ファイルには拡張子の数がたくさんあるが、アップロードする画像の拡張子を制限する。
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # ファイル名の変換
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
