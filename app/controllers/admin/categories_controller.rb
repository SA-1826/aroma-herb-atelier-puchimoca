class Admin::CategoriesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @category = Category.new
    @categories = Category.find(params[:id])
  end

  def create
    @category = current_admin.categories.builds(category_params)
    if @category.save
      flash[:notice] = "カテゴリーを登録しました"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = "カテゴリーの登録に失敗しました"
      render admin_categories_path
    end
  end

  def edit
  end
end
