class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :is_matching_draft_status, only: [:show]
  before_action :is_matching_post, only: [:edit, :update, :destroy]
  
  def new
    @post = Post.new
  end

  def index
    @posts = Post.where(is_active: false, draft_status: false).order(created_at: "DESC").page(params[:page]).per(8)
    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @word = @tag.tag_name
      @posts = @tag.posts.where(is_active: false, draft_status: false).order(created_at: "DESC").page(params[:page]).per(8)
    end
  end

  def show
    @post= Post.find(params[:id])
    @post_comment = Comment.new
    @post_tags = @post.tags
    @post_comments = @post.comments.order(created_at: "DESC").page(params[:page]).per(10)
  end

  def edit
    @post= Post.find(params[:id])
    @post_tags = @post.tags.pluck(:tag_name).split(nil)
  end
  
  def create
    @post = current_user.posts.new(post_params)
    tag_list = params[:post][:tag_name].split(nil)
      if @post.save
        @post.save_tag(tag_list)
        redirect_to post_path(@post.id)
      else
      render :new, notice: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください。"
      end
  end
  
  def update
    #postのidを取得
    @post= Post.find(params[:id])
    @post.draft_status = false
    #入力されたタグの受け取り
    tag_list = params[:post][:tag_name].split(nil)
    if @post.update(post_params)
      old_relations = PostTag.where(post_id: @post.id)
      old_relations.each do |relation|
        relation.delete
      end
      @post.save_tag(tag_list)
      redirect_to post_path(@post.id), notice: "更新しました。"
    else
      render :edit
    end
  end
  
  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "削除しました。"
  end
  
  def draft
    @posts = current_user.posts.where(draft_status: true).order(created_at: "DESC").page(params[:page]).per(8)
  end
  
  def is_active
    @posts = current_user.posts.where(is_active: true).order(created_at: "DESC").page(params[:page]).per(8)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:name, :place, :explanation, :user_id, :category_id, :is_active, :draft_status, post_image: [])
  end
  
  def is_matching_draft_status
    @post= Post.find(params[:id])
      unless @post.user_id == current_user.id
        if @post.draft_status == true
          flash[:notice] = "そのページにはアクセスできません。"
          redirect_to root_path
        end
      end
  end
  
  def is_matching_post
    @post= Post.find(params[:id])
      unless @post.user_id == current_user.id
        flash[:notice] = "そのページにはアクセスできません。"
        redirect_to root_path
      end
  end
  
end
