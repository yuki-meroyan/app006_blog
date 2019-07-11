class UsersController < ApplicationController
  before_action :set_userbloglists, only: [:show, :index, :edit, :update]
  
  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
      # render controller: 'blogtexts', action: 'edit'
    end
  end

  def edit
    @blogtext = Blogtext.where(user_id: current_user.id).order("created_at DESC").find_by(params[:id])
  end

  def index
    @blogtext = Blogtext.where(user_id: current_user.id).order("created_at DESC").find_by(params[:id])
  end

  

  def show
    @blogtext = Blogtext.find(params[:id])
    @comment = Comment.new
    @comments = @blogtext.comments.includes(:user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_userbloglists
    @blogtexts = Blogtext.where(user_id: current_user.id).order("created_at DESC")
  end
  
end
