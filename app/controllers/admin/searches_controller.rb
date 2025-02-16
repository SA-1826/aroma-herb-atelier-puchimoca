class Admin::SearchesController < ApplicationController
  layout 'admin'
  
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'program'
      @records = Program.search_for(@content, @method).page(params[:programs_page]).per(6)
    elsif @model == 'group'
      @records = Group.search_for(@content, @method).page(params[:groups_page]).per(6)
    elsif @model == 'user'
      @records = User.search_for(@content, @method).page(params[:users_page]).per(6)
    elsif @model == 'post'
      @records = Post.search_for(@content, @method).page(params[:posts_page]).per(6)
    else
      @records = Comment.search_for(@content, @method).page(params[:comments_page]).per(6)
    end
  end
end
