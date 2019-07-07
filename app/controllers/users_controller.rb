class UsersController < ApplicationController
  before_action :set_userbloglists, only: [:show, :index]
  
  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    # binding.pry
    @blogtexts = Blogtext.where(user_id: current_user.id).order("created_at DESC")
    @blogtext = Blogtext.find(params[:id])
    # @blogtexts = user.blogtexts.order("created_at DESC")
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_userbloglists
    @blogtexts = Blogtext.where(user_id: current_user.id).order("created_at DESC")
  end
  
end
