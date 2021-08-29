class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @user = User.find(@comment.user_id)
      ActionCable.server.broadcast 'comment_channel', comment: @comment, user_name: @user
    else
    redirect_to item_path(@comment.item.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
