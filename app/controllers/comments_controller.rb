class CommentsController < ApplicationController
    def index
        @comments = Comment.all.order(:created_at).reverse
        render json: @comments.to_json(comment_serializer)
    end

    def create
        comment = Comment.create!(user_id: params["comment"]["user_id"], article_id: params["comment"]["article_id"], content: params["comment"]["content"])

        if comment
            render json: {
                status: :created,
                comment: comment
            }
        else
            render json: { status: 500 }  
        end
    end

    def update
        comment = Comment.find(params["id"])
        # binding.pry
        comment.content = params["comment"]["content"]
        comment.save

        if comment
            render json: {
                status: :edited,
                comment: comment
            }
        else
            render json: { status: 500 }  
        end
    end

    private

    def comment_serializer
        {
            :only => [:id, :user_id, :created_at, :content],
                :include => [:comment_pops => {
                    :include => [:user]
                }]
                        
            }
    end
end
