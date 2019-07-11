class CommentsController < ApplicationController
  before_action :comment_params, only: [:new, :create]

  def new
  end

  def create
    Comment.create(comment_params)
    redirect_to controller: 'blogtexts', action: 'index'
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(blogtext_id: params[:blogtext_id],user_id: current_user.id)
  end

end
