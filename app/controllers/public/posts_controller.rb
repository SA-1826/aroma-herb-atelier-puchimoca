class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to post_path(@post)
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "更新しました"
      redirect_to post_path(@post)
    else
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to mypage_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
