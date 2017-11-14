class Prototypes::NewestController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user, :main_image).order("created_at DESC").page(params[:page]).per(3)
    @active     = "newest"
  end
end
