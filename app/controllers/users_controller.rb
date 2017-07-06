class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def edit
    @user = current_user
	end

  def update
    @user = current_user
    if @user.update(user_params)
      binding.pry
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :title, :job, :profile, :avatar, :email, :password)
  end

end
