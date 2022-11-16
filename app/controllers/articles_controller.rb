
class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new

  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    # https://stackoverflow.com/questions/1997201/what-exactly-does-save-save-do
    @article.save!
    redirect_to @article
  end

end