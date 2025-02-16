class Admin::CommentsController < ApplicationController
  layout 'admin'
  
  def index
    @comments = Comment.page(params[:comments_page]).per(6)
    @total_comments_count = Comment.all.count
  end

  def show
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_comments_path
  end
end
