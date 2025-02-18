class Public::PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    @new_programs = Program.published.order(created_at: :desc).limit(3)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to post_path(@post)
    else
      flash.now[:danger] = "投稿に失敗しました"
      @new_programs = Program.published.order(created_at: :desc).limit(3)
      render :new
    end
  end

  def index
    @posts = Post.page(params[:posts_page]).per(6)
    @total_posts_count = Post.all.count
    @new_programs = Program.published.order(created_at: :desc).limit(3)
  end

  def edit
    @post = Post.find(params[:id])
    @total_comments_count = @post.comments.all.count
    @new_programs = Program.published.order(created_at: :desc).limit(3)
    if @post.comments.present?
      @comments = @post.comments.page(params[:comments_page]).per(6)
    else
      @comments = Comment.none.page(params[:comments_page]).per(6)
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "更新しました"
      redirect_to post_path(@post)
    else
      flash.now[:danger] = "更新に失敗しました"
      @total_comments_count = @post.comments.all.count
      @new_programs = Program.published.order(created_at: :desc).limit(3)
      if @post.comments.present?
        @comments = @post.comments.page(params[:comments_page]).per(6)
      else
        @comments = Comment.none.page(params[:comments_page]).per(6)
      end
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @total_comments_count = @post.comments.all.count
    @new_programs = Program.published.order(created_at: :desc).limit(3)
    if @post.comments.present?
      @comments = @post.comments.page(params[:comments_page]).per(6)
    else
      @comments = Comment.none.page(params[:comments_page]).per(6)
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "削除しました"
    redirect_to mypage_path(current_user)
  end

  private

  def is_matching_login_user
    post = Post.find(params[:id])
    unless post.user.id == current_user.id
      redirect_to post_path(params[:id])
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
