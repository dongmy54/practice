class ArticlesController < ApplicationController
  # 基本身份认证
  http_basic_authenticate_with name: 'dmy',password: 'dmy067', expect: [:index, :show]

  # 强制启动ssl 
  # 本地需要用 bundle exec thin start --ssl 才能支持
  # force_ssl

  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
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
      redirect_to @article
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
    redirect_to articles_path
  end

  private
    
    def article_params
      params.require(:article).permit(:title,:text)
    end

end
