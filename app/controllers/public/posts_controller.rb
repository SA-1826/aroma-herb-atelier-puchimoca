class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def index
  end

  def edit
  end

  def update
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
