class Admin::UsersController < ApplicationController
  layout 'admin'

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
    @comments = @user.comments.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def withdraw
  end
end
