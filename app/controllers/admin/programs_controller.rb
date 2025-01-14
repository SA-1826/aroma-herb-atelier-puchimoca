class Admin::ProgramsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def new
    @program = Program.new
  end

  def create
    @program = current_admin.programs.build(program_params)
    if @program.save
      flash[:notice] = "投稿しました"
      redirect_to edit_admin_program_path(@program)
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def index
    @programs = Program.all
  end

  def edit
    @program = Program.find(params[:id])
  end

  def update
    @program = Program.find(params[:id])
    if @program.update(program_params)
      flash[:notice] = "変更を保存しました"
      redirect_to edit_admin_program_path(@program)
    else
      flash.now[:notice] = "変更の保存に失敗しました"
      render :edit
    end
  end

  def destroy
    program = Program.find(params[:id])
    program.destroy
    redirect_to admin_programs_path
  end

  private

  def program_params
    params.require(:program).permit(:image, :category_id, :title, :body, :start_time, :publish_status, :time_required, :price)
  end
end
