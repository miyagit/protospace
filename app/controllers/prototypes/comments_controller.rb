class Prototypes::CommentsController < ApplicationController

  before_action :set_prototype

  def create
    @comment = @prototype.comments.create(comment_params)
    @comments = @prototype.comments.includes(:user)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

  def set_prototype
    @prototype = Prototype.find(params.require(:comment)[:prototype_id])
  end
end
