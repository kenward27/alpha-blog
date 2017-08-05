class ArticlesController < ApplicationController
  def new 
    @article = Article.new 
  end 
  
  def create
    @article = Article.new(article_params)
    if @article.save
      #do something
      flash[:notice] = "Article was successfully created" #display message to user
      redirect_to article_path(@article)
    else
      render 'new' #renders the new template again
    end #validation failed and article was not saved
  end
  
  def show 
    @article = Article.find(params[:id])
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end 