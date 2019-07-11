class CommentsController < ApplicationController
  before_action :comment_params, only: [:new, :create]

  def new
    # @blogtext = Blogtext.find(params[:blogtext_id])
    # @comment = Comment.new
  end

  def create
    Comment.create(comment_params)
    redirect_to controller: 'blogtexts', action: 'index'
  end

  private
  def comment_params
    # params.permit(:comment, :blogtext_id)
    params.require(:comment).permit(:comment).merge(blogtext_id: params[:blogtext_id],user_id: current_user.id)
  end

end
