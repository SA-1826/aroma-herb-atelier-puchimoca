class Public::ProgramsController < ApplicationController
  def index
    published_programs = Program.published
    if params[:start_date].present? || params[:end_date].present?
      start_date = params[:start_date].present? ? Time.zone.parse(params[:start_date]) : nil
      end_date = params[:end_date].present? ? Time.zone.parse(params[:end_date]).end_of_day : nil
      published_programs = published_programs.where(start_time: start_date..end_date)
    end
    case params[:sort]
    when "start_time_asc"
      programs = published_programs.order(start_time: :asc)
    when "updated_at_desc"
      programs = published_programs.order(updated_at: :desc)
    when "category_asc"
      programs = published_programs.order(category_id: :asc)
    else
      programs = published_programs.order(updated_at: :desc)
    end
    @programs = programs.page(params[:programs_page]).per(6)
    @new_programs = Program.published.order(updated_at: :desc).limit(3)
  end

  def show
    @program = Program.find(params[:id])
    @new_programs = Program.published.order(updated_at: :desc).limit(3)
  end
end
