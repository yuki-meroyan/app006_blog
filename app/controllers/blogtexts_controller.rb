class BlogtextsController < ApplicationController
  before_action :set_bloglists, only: [:new, :show, :index, :edit]

  def new
    @blogtext = Blogtext.new
  end

  def create
    Blogtext.create(title: blogtext_params[:title], text: blogtext_params[:text], user_id: current_user.id)
    redirect_to action: :index
  end

  def show
    @blogtext = Blogtext.find(params[:id])
    @comment = Comment.new
    @comments = @blogtext.comments.includes(:user)
  end

  def index
    @blogtext = Blogtext.order("created_at DESC").find_by(params[:id])
  end

  def destroy
    blogtext = Blogtext.find(params[:id])
    if blogtext.user_id == current_user.id
      blogtext.destroy
      redirect_to users_path(current_user.id)
    end
      
  end

  def update
    blogtext = Blogtext.find(params[:id])
    if blogtext.user_id == current_user.id
      blogtext.update(blogtext_params)
    end
    redirect_to action: :show
  end

  def edit
    @blogtext = Blogtext.find(params[:id])
  end

  private
  def blogtext_params
    params.require(:blogtext).permit(:title, :text)
  end

  def set_bloglists
    @blogtexts = Blogtext.includes(:user).order("created_at DESC")
  end

end
