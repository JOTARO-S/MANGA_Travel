class Public::SearchesController < ApplicationController
    
    def search
        @range = params[:range]
        @word = params[:word]
    
        if @range == "User"
            @users = User.looks(params[:search], params[:word])
        else
            @posts = Post.looks(params[:search], params[:word])
        end
    end
    
    def search_tag
        @word = params[:keyword]
        @post = Post.looks(params[:search], params[:keyword])
    end
    
end
