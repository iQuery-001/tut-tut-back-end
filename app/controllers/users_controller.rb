class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users.to_json(user_serializer)
    end


private
    def user_serializer
            {
                :only => [:id, :email],
                    :include => [:comments]
            }
    end

    
end
