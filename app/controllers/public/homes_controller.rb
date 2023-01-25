class Public::HomesController < ApplicationController
  def top

    @posts = Post.find(Bookmark.group(:post_id).order('count(post_id) desc').limit(8).pluck(:post_id))
    @tags = Tag.find(PostTag.group(:tag_id).order('count(post_id) desc').limit(10).pluck(:tag_id))
    
  end

  def help
  end

  def privacy
  end

  def terms
  end

end
