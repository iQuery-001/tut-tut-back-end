class SessionsController < ApplicationController
    include CurrentUserConcern

    def create
        puts params
        user = User.find_by(email: params["user"]["email"]).try(:authenticate, params["user"]["password"])

        if user
            session[:user_id] = user.id
            render json: {
                status: :created,
                logged_in: true,
                user: user.email
            }
            puts "====="
            puts session[:user_id]
            puts "====="

        else
            render json: { status: 401 }  
        end
    end

    def log_out
        reset_session
        render json: {
            status: 200,
            logged_out: true
        }
    end

    def logged_in
        set_current_user();
        puts "============"
        puts @current_user
        puts session[:user_id]
        puts "============"
        if @current_user
            render json: {
                logged_in: true,
                user: @current_user
            }
        else 
            render json: {
                logged_in: false
            }
        end
    end
end
