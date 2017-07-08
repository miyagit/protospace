class PrototypesController < ApplicationController

	def index
	end

	def show
	end

	def new
    @prototype = Prototype.new
    @prototype.images.build
	end

	def create
    Prototype.create(prototype_params)
	end

	private

	def prototype_params
		params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:image, :user_id]).merge(user_id: current_user.id)
	end

end
