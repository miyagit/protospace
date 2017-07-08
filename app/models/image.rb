class Image < ApplicationRecord
	belongs_to :prototype
	mount_uploader :image, ImageUploader
end
