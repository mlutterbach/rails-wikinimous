class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  def index
    @articles = Article.all
  end

  def show
    # get "articles/:id", to: "articles#show"
  end

  def new
    #create a blank instance of article
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  def edit
  end

  def update
    #find the specific article
    #update the article with the strong params
    @article.update(article_params)
    #redirect to updated article
    redirect_to article_path(@article)
  end

  def destroy
    #find the article with the specific id
    #destroy
    @article.destroy
    #redirect to index page
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    # whitelisting the params that are passed in the form
    params.require(:article).permit(:title, :content)
  end
end
