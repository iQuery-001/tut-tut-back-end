class ArticlesController < ApplicationController
    def index
        @articles = Article.all.order(:created_at).reverse
        render json: @articles.to_json(article_serializer)
    end

    def create
        article = Article.create!(user_id: params["article"]["user_id"], title: params["article"]["title"], url: params["article"]["url"], desc: params["article"]["desc"])

        if article
            render json: {
                status: :created,
                article: article
            }
        else
            render json: { status: 500 }  
        end
    end

    private
    def article_serializer
            {
                :only => [:title, :url, :description, :created_at, :id],
                :include => [:article_pops => {
                    :include => [:user]
                }]
            }
    end
end
