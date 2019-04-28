class V1::ArticlesController < ApplicationController

    before_action :get_article, only: [:show]

    # GET /articles
    def index
        @all_articles = Article.all.paginate(page: params[:page], per_page: 20)
        to_http_json(@all_articles)
    end

    # POST /articles
    def create
        @new_article = Article.create!(article_params)
        to_http_json(@new_article, :created)
    end

    # GET /articles/:id
    def show
        to_http_json(@article)
    end

    private

    def article_params
      params.permit(:title, :content, :created_by)
    end
  
    def get_article
      @article = Article.find(params[:id])
    end

end
