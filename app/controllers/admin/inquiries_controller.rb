class Admin::InquiriesController < ApplicationController
  layout 'admin'
  
  def index
    @inquiries = Inquiry.page(params[:inquiries_page]).per(6)
    @total_inquiries_count = Inquiry.all.count
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    if @inquiry.update(inquiry_params)
      flash[:notice] = "変更を保存しました"
      redirect_to admin_inquiries_path
    else
      flash[:danger] = "変更の保存に失敗しました"
      redirect_back(fallback_location: root_url)
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:title, :body, :email, :status)
  end
end
