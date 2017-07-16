class PrototypesController < ApplicationController

	def index
		@prototypes = Prototype.all
	end

	def show
		@prototype = Prototype.find(params[:id])
	end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    Prototype.create(prototype_create_params)
    redirect_to root_path, notice: "prototypeを投稿しました。"
  end

	def edit
		@prototype = Prototype.find(params[:id])
	end

  def update
    Prototype.update(prototype_update_params)
    redirect_to root_path, notice: "prototypeの情報を更新しました。"
  end

  def destroy
    prototype = Prototype.find(params[:id])
      if prototype.user_id == current_user.id
        prototype.destroy
        redirect_to root_path, notice: "prototypeを削除しました。"
      end
  end

	private

  def prototype_create_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:image, :user_id]).merge(user_id: current_user.id)
  end

  def prototype_update_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:id, :image, :user_id]).merge(user_id: current_user.id)
  end

end
