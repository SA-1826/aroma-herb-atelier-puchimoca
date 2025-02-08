class Admin::PostsController < ApplicationController
  layout 'admin'
  
  def index
    @posts = Post.page(params[:page])
    @total_posts_count = Post.all.count
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.page(params[:page])
    @total_comments_count = @post.comments.count
  end
end
