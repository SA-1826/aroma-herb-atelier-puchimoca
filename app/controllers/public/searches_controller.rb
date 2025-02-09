class Public::SearchesController < ApplicationController

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'user'
      @records = User.search_for(@content, @method).page(params[:users_page])
    else
      @records = Post.search_for(@content, @method).page(params[:posts_page])
    end
  end

end
