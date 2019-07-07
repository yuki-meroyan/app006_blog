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
  end

  def index
    
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

  def set_comments
    @comments = Blogtext.find(params[id]).includes(:comment)
  end

end
