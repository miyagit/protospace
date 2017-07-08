class PrototypesController < ApplicationController

	def index
		@prototypes = Prototype.where(user_id: current_user)
	end

	def show
		@prototype = Prototype.find(params[:id])
	end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    prototype = current_user.prototypes.new(prototype_params)
    if prototype.save
      redirect_to root_path notice: "prototypeを投稿しました。"
    else
      render :new
      flash[:alert] = "prototypeの投稿に失敗しました。"
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: %w(image status))
  end
end
