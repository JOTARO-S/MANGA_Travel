class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post= Post.find(params[:id])
  end

  def edit
    @post= Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.post_tag_id = current_user.id #タグ機能作成後、変更すること
      if @post.save
        redirect_to post_path(@post.id)
      else
      render :new, notice: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください。"
      end
  end
  
  def update
    @post= Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end
  
  def destroy
  end
  
  def draft
  end
  
  def draft_edit
  end
  
  def draft_destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:name, :place, :explanation, :user_id, :post_tag_id, :category_id, :is_active, :draft_status, post_image: [])
  end
end
