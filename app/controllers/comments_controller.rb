class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
      if @comment.save
end


def create
  @comment = Comment.new
  @comment.topic_id = params[:topic_id]
  @comment.content = params[:content]
  if @comment.save
    redirect_to topics_path, success: 'コメントに成功しました'
  else
    flash.now[:danger] = "コメントに失敗しました"
    render :new
  end
end


  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end