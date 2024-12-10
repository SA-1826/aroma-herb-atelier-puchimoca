class Admin::GroupsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
  end

  def show
  end
end
