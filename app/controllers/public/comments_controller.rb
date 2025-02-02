class Public::CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to post_path(@post)
    else
      flash.now[:danger] = "コメントの投稿に失敗しました"
      @comments = @post.comments.all
      render 'public/posts/show'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    post = Post.find(params[:post_id])
    flash[:notice] = "削除しました"
    redirect_to post_path(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
