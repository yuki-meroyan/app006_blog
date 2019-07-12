class CommentsController < ApplicationController
  before_action :comment_params, only: [:new, :create]
  before_action :set_blogtext, only: [:create]

  def new
  end

  def create
    # Comment.create(comment_params)
    @comment = @blogtext.comments.new(comment_params)
    # binding.pry
    if @comment.save
      respond_to do |format|
        format.html { redirect_to blogtext_path(comment_params[:blogtext_id]) }
        format.json
      end
    else
      redirect_to blogtext_path(comment_params[:blogtext_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end

  def set_blogtext
    @blogtext = Blogtext.find(params[:blogtext_id])
  end

end
