class Admin::ProgramsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def new
  end

  def index
  end

  def edit
  end
end
