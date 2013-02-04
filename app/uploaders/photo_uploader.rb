# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
    include Cloudinary::CarrierWave
  #include CarrierWave::MiniMagick

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
   include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  #storage :file
  # storage :s3
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  #def store_dir
  #  "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  #end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
 process :resize_to_fit => [350, 4999]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
   version :thumb do
     process :resize_to_fit => [50, 50]
   end 
   version :medium do
     process :resize_to_fit => [350, 350]
   end
   version :large do
     process :resize_to_fit => [650, 650]
   end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_white_list
     %w(jpg jpeg gif png)
   end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

    # Generate a 164x164 JPG of 80% quality 
  version :simple do
    process :resize_to_fill => [164, 164, :fill]
    process :convert => 'jpg'
    cloudinary_transformation :quality => 80
  end
  
  # Generate a 100x150 face-detection based thumbnail, 
  # round corners with a 20-pixel radius and increase brightness by 30%.
  version :bright_face do
    cloudinary_transformation :effect => "brightness:30", :radius => 20,
      :width => 100, :height => 150, :crop => :thumb, :gravity => :face
  end

  # Apply an incoming chained transformation: limit image to 1000x1200 and 
  # add a 30-pixel watermark 5 pixels from the south east corner.   
 # cloudinary_transformation :transformation => [
  #    {:width => 1000, :height => 1200, :crop => :limit}, 
   #   {:overlay => "my_watermark", :width => 30, :gravity => :south_east, 
    #   :x => 5, :y => 5}
   # ]        
  
  # Eagerly transform image to 150x200 with a sepia effect applied and then
  # rotate the resulting image by 10 degrees. 
  version :rotated do
    eager
    cloudinary_transformation :transformation => [
        {:width => 150, :height => 200, :crop => :fill, :effect => "sepia"}, 
        {:angle => 10}
      ]
  end

  version :full do    
    process :convert => 'jpg'
    process :custom_crop
  end    
  
  def custom_crop      
    return :x => model.crop_x, :y => model.crop_y, 
      :width => model.crop_width, :height => model.crop_height, :crop => :crop      
  end

end