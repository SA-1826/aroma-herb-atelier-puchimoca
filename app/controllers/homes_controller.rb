class HomesController < ApplicationController
  def home
    @programs = Program.published.order(created_at: :desc).limit(3)
  end

  def about
  end
end
