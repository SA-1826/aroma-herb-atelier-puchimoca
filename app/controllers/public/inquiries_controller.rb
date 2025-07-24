class Public::InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
    @new_programs = Program.published.order(updated_at: :desc).limit(3)
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.status = 0
    if @inquiry.save
      flash[:notice] = "送信しました"
      redirect_to thanks_path
    else
      flash.now[:danger] = "送信に失敗しました"
      @new_programs = Program.published.order(updated_at: :desc).limit(3)
      render :new
    end
  end

  def thanks
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:title, :body, :email, :status)
  end
end
