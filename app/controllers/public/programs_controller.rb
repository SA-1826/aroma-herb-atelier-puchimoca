class Public::ProgramsController < ApplicationController
  def index
    @programs = Program.published.page(params[:programs_page]).per(6)
    @new_programs = Program.published.order(created_at: :desc).limit(3)
  end

  def show
    @program = Program.find(params[:id])
    @new_programs = Program.published.order(created_at: :desc).limit(3)
  end
end
