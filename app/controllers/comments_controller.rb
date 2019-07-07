class CommentsController < ApplicationController

  def create
    # コメントと結びつくツイートの詳細画面に遷移する
    @comment = Comment.create(comment: comment_params[:comment], blogtext_id: comment_params[:blogtext_id], user_id: current_user.id)
  end

  private
  def comment_params
    params.permit(:comment, :blogtext_id)
  end

end
