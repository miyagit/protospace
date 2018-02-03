class PrototypesController < ApplicationController

  before_action :authenticate_user!, only: [:index, :new]

  def index
    @prototypes = Prototype.includes(:user, :main_image).order("likes_count DESC").page(params[:page]).per(3)
    @active     = "popular"
  end

  def show
    @prototype = Prototype.find(params[:id])
    @like = @prototype.likes.find_by(user_id: @prototype.user.id, prototype_id: params[:id])
    @comment = Comment.new
    @comments = @prototype.comments
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
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:image, :status]).merge(user_id: current_user.id, tag_list: params[:prototype][:tag_list])
  end

  def prototype_update_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :tag_list, images_attributes: [:id, :image]).merge(user_id: current_user.id)
  end

end
