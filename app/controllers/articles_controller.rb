class ArticlesController < ApplicationController
  
  def index 
    #grab all articles in database
    @articles = Article.all
  end 
  
  def new 
    @article = Article.new 
  end 
  
  def edit 
    @article = Article.find(params[:id])
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
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def show 
    @article = Article.find(params[:id])
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end 