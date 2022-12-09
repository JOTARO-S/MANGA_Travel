class Public::SearchesController < ApplicationController
    
    def search
        @range = params[:range]
        @word = params[:word]
    
        if @range == "ユーザー検索"
            @users = User.looks(params[:search], params[:word])
        else
            if params[:word].empty? && params[:prefectures].empty? && params[:tag_id].empty?
                @search_params = "条件なし"
                @posts = Post.all
                
            elsif params[:prefectures].empty? && params[:tag_id].empty?
                @search_params = "タイトル = #{params[:word]}"
                @posts = Post.looks(params[:search], params[:word])
                
            elsif params[:word].empty? && params[:prefectures].empty?
                @search_params = "タグ = #{params[:tag_id]}"
                @tag = Tag.find(params[:tag_id])
                @posts = @tag.posts
                
            elsif params[:word].empty? && params[:tag_id].empty?
                @search_params = "所在地 = #{params[:prefectures]}"
                @prefectures = Category.find(params[:prefectures])
                @posts = @prefectures.posts
                
            else
                if params[:word].empty?
                    @search_params = "所在地 = #{params[:prefectures]}, タグ = #{params[:tag_id]}"
                    @prefectures = Category.find(params[:prefectures])
                    @tag = Tag.find(params[:tag_id])
                    @posts = Post.where(category_id: @prefectures, tag_id: @tag) #要調整
                    
                elsif params[:prefectures].empty?
                    @search_params = "タイトル = #{params[:word]}, タグ = #{params[:tag_id]}"
                    @tag = Tag.find(params[:tag_id])
                    @posts = @tag.posts.looks(params[:search], params[:word])
                    
                elsif params[:tag_id].empty?
                    @search_params = "タイトル = #{params[:word]}, 所在地 = #{params[:prefectures]}"
                    @prefectures = Category.find(params[:prefectures])
                    @posts = @prefectures.posts.looks(params[:search], params[:word])
                
                else
                    @search_params = "タイトル = #{params[:word]}, 所在地 = #{params[:prefectures]}, タグ = #{params[:tag_id]}"
                    @tag = Tag.find(params[:tag_id])
                    @prefectures = Category.find(params[:prefectures])
                    @posts = Post.where(category_id: @prefectures, tag_id: @tag).looks(params[:search], params[:word]) #要調整
                end
            end
        end
    end
    
end
