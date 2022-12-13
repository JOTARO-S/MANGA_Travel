class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post= Post.find(params[:id])
    @post_comment = Comment.new
    @post_tags = @post.tags
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
    @posts = current_user.posts
  end
  
  def draft_edit
  end
  
  def draft_destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:name, :place, :explanation, :user_id, :category_id, :is_active, :draft_status, post_image: [])
  end
end
