class Public::SearchesController < ApplicationController

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'user'
      @records = User.search_for(@content, @method).page(params[:users_page]).per(6)
    else
      @records = Post.search_for(@content, @method).page(params[:posts_page]).per(6)
    end
  end

end
