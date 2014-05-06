class CommentsController < ApplicationController
    def new
        @photo = Photo.find(params[:photo_id])
        @user = @photo.user
        @comments = @photo.comments
        @title = @user.full_name + " photo: "+@photo.date_time
        @comment = Comment.new
    end
    
    def create
        @photo = Photo.find(params[:photo_id])
        @user = @photo.user
        @comment = Comment.new(comment_params)
        @comment.user = session[:login]
        @comment.date_time = DateTime.now
        @comment.photo = @photo
        if @comment.save
            redirect_to @comment.photo.user
        else
            render 'new'
        end
    end
    
    def index
    end
    
    def show
    end
    
    private
        def comment_params
            params.require(:comment).permit(:photo,:user,:date_time,:comment)
        end
end
