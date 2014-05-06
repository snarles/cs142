class UsersController < ApplicationController
    def index
        @title = "List of Users"
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
        @title = @user.first_name + " " + @user.last_name + " page"
    end
    
    def login
        @title = "Login"
    end
    
    def post_login
        @user = User.find_by_login(params[:login])
        if @user.nil?
            session[:login_error] = :not_found    
            redirect_to :back, status: 302
        else
            session[:login] = params[:login]
            session[:login_error] = nil    
            redirect_to @user, status: 302
        end
    end
    
    def logout
        session[:login] = nil
        redirect_to action: :index, status: 302
    end
end
