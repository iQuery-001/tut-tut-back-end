class ArticlesController < ApplicationController
    def index
        @articles = Article.all.order(:created_at).reverse
        render json: @articles.to_json(article_serializer)
    end

    def create
        article = Article.create!(user_id: params["article"]["user_id"], title: params["article"]["title"], url: params["article"]["url"], description: params["article"]["desc"])

        if article
            render json: {
                status: :created,
                article: article
            }
        else
            render json: { status: 500 }  
        end
    end
    
    def show
        @article = Article.find(params["id"])
        render json: @article.to_json(article_serializer)
    end

    private
    def article_serializer
            {
                :only => [:user_id, :title, :url, :description, :created_at, :id],
                :include => [:comments, :article_pops => {
                    :include => [:user]
                }]
            }
    end
end
