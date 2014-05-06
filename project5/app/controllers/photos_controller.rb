class PhotosController < ApplicationController
    before_filter :require_login
    
    def new
        @title = "Upload a new photo"
        @photo = Photo.new
    end
    
    def create
        @photo = Photo.new
        filename = params[:photo][:input_file].original_filename
        @photo.file_name = filename
        @photo.date_time = DateTime.now
        @photo.user = session[:login]
        if @photo.save
            path = Rails.root.join("app","assets","images",filename)
            open(path,"wb") do |file|
                file << params[:photo][:input_file].read
            end
            flash[:notice] = "Photo: "+filename+" successfully uploaded"
            redirect_to @photo.user
        else
            render 'new'
        end
    end
    
    private
    def require_login
        if session[:login].nil?
            flash[:notice] = "You must log in before posting photos."
            redirect_to users_path
        end
    end
end
