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
    params.require(:prototype).permit(:title, :catch_copy, :concept, images_attributes: [:image, :status])
  end
end
