class Prototype < ApplicationRecord
	belongs_to :user
	has_many :images,   dependent: :destroy
	has_many :likes,    dependent: :destroy
	has_many :comments, dependent: :destroy
	has_one  :main_image, class_name: Image
	accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc { |attributes| attributes['image'].blank? }, limit: 4

	def like_user(user_id)
		likes.find_by(user_id: user_id)
	end

end
