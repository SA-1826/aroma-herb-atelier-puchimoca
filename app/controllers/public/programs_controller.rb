class Public::ProgramsController < ApplicationController
  def index
    published_programs = Program.published
    case params[:sort]
    when "start_time_asc"
      programs = published_programs.order(start_time: :asc)
    when "created_at_desc"
      programs = published_programs.order(created_at: :desc)
    when "category_asc"
      programs = published_programs.order(category_id: :asc)
    else
      programs = published_programs.order(created_at: :desc)
    end
    @programs = programs.page(params[:programs_page]).per(6)
    @new_programs = Program.published.order(created_at: :desc).limit(3)
  end

  def show
    @program = Program.find(params[:id])
    @new_programs = Program.published.order(created_at: :desc).limit(3)
  end
end
