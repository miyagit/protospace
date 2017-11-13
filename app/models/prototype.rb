class Prototype < ApplicationRecord
	belongs_to :user
	has_many :images, dependent: :destroy
	has_many :likes,  dependent: :destroy
	has_many :comments
	accepts_nested_attributes_for :images, allow_destroy: true

	def like_user(user_id)
		likes.find_by(user_id: user_id)
	end

end
