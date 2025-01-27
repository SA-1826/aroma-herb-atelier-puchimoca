class Admin::CategoriesController < ApplicationController
  layout 'admin'
  
  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "カテゴリーを登録しました"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = "カテゴリーの登録に失敗しました"
      @categories = Category.all
      render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.all
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "変更を保存しました"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = "変更の保存に失敗しました"
      @categories = Category.all
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
