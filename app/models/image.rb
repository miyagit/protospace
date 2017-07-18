class Image < ApplicationRecord
	enum status: %w(main sub)
	belongs_to :prototype
	mount_uploader :image, ImageUploader
end
