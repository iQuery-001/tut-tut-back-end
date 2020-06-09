class CommentsController < ApplicationController
    def index
        @comments = Comment.all
        render json: @comments.to_json(comment_serializer)
    end


    private

    def comment_serializer
        {
            :only => [:user_id, :content],
                :include => [:comment_pops => {
                    :include => [:user]
                }]
                        
            }
    end
end
