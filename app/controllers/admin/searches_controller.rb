class Admin::SearchesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def search
  end
end
