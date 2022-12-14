class Public::SearchesController < ApplicationController
    
    def search
        @range = params[:range]
        @word = params[:word]
        
        #ユーザー側の検索機能
        if @range == "ユーザー検索"
            
            
            if params[:word] == nil
                @word == "条件なし"
            end
            
            @users = User.where(is_deleted: false).looks(params[:search], params[:word]).page(params[:page]).per(12)
        
        #投稿側の検索機能    
        else
            #未入力で検索した場合
            if params[:word].empty? && params[:prefectures].empty? && params[:tag_id].empty?
                @search_params = "条件なし"
                @posts = Post.where(is_active: false, draft_status: false).page(params[:page]).per(8)
                
            #タイトルのみ入力して検索した場合
            elsif params[:prefectures].empty? && params[:tag_id].empty?
                @search_params = "タイトル = #{params[:word]}"
                @posts = Post.where(is_active: false, draft_status: false).looks(params[:search], params[:word]).page(params[:page]).per(8)
            
            #タグのみ入力して検索した場合    
            elsif params[:word].empty? && params[:prefectures].empty?
                @tag = Tag.find(params[:tag_id])
                @search_params = "タグ = #{@tag.tag_name}"
                @posts = @tag.posts.where(is_active: false, draft_status: false).page(params[:page]).per(8)
            
            #所在地のみ入力して検索した場合    
            elsif params[:word].empty? && params[:tag_id].empty?
                @prefectures = Category.find(params[:prefectures])
                @search_params = "所在地 = #{@prefectures.name}"
                @posts = @prefectures.posts.where(is_active: false, draft_status: false).page(params[:page]).per(8)
            
            #複数検索  
            else
                #タグと所在地のみ入力して検索した場合
                if params[:word].empty?
                    @tag = Tag.find(params[:tag_id])
                    @prefectures = Category.find(params[:prefectures])
                    @search_params = "所在地 = #{@prefectures.name}, タグ = #{@tag.tag_name}"
                    @posts = @tag.posts.where(is_active: false, draft_status: false).where(category_id: @prefectures.id).page(params[:page]).per(8)
                
                #タイトルとタグのみ入力して検索した場合    
                elsif params[:prefectures].empty?
                    @tag = Tag.find(params[:tag_id])
                    @search_params = "タイトル = #{params[:word]}, タグ = #{@tag.tag_name}"
                    @posts = @tag.posts.looks(params[:search], params[:word]).page(params[:page]).per(8)
                
                #タイトルと所在地のみ入力して検索した場合    
                elsif params[:tag_id].empty?
                    @prefectures = Category.find(params[:prefectures])
                    @search_params = "タイトル = #{params[:word]}, 所在地 = #{@prefectures.name}"
                    @posts = @prefectures.posts.where(is_active: false, draft_status: false).looks(params[:search], params[:word]).page(params[:page]).per(8)
                
                #全て入力して検索した場合
                else
                    @tag = Tag.find(params[:tag_id])
                    @prefectures = Category.find(params[:prefectures])
                    @search_params = "タイトル = #{params[:word]}, 所在地 = #{@prefectures.name}, タグ = #{@tag.tag_name}"
                    @posts = Post.where(is_active: false, draft_status: false).page(params[:page]).per(8)
                    @posts = @tag.posts.where(is_active: false, draft_status: false).where(category_id: @prefectures.id).looks(params[:search], params[:word]).page(params[:page]).per(8)
                end
            end
        end
    end
    
end
