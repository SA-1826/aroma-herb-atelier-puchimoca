class Public::ProgramsController < ApplicationController
  def index
    @programs = Program.published.all
    @new_programs = Program.published.order(created_at: :desc).limit(3)
  end

  def show
    @program = Program.find(params[:id])
    @new_programs = Program.published.order(created_at: :desc).limit(3)
  end
end
