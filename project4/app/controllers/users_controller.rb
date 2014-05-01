class UsersController < ApplicationController
    def index
        @title = "List of Users"
        @users = User.all
    end
end
