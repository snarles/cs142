class UsersController < ApplicationController
    def index
        @title = "List of Users"
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
        @title = @user.first_name + " " + @user.last_name + " page"
    end
end
