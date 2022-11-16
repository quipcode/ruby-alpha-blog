
class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new()
  end
  def edit
    @article =Article.find(params[:id])
  end
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    # https://stackoverflow.com/questions/1997201/what-exactly-does-save-save-do
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else
      render 'new'
    end
  end
  def update
    @article =Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      redirect_to @article
    else
      render 'edit'
    end
  end 

end