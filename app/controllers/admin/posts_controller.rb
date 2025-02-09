class Admin::PostsController < ApplicationController
  layout 'admin'
  
  def index
    @posts = Post.page(params[:posts_page])
    @total_posts_count = Post.all.count
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.page(params[:comments_page])
    @total_comments_count = @post.comments.count
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_posts_path
  end
end
