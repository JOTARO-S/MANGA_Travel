class Public::PostsController < ApplicationController
  def new
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  def draft
  end
  
  def draft_edit
  end
  
  def draft_destroy
  end
end
