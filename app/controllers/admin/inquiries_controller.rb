class Admin::InquiriesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
  end

  def show
  end
end
