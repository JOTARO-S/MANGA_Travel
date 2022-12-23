class Public::HomesController < ApplicationController
  def top
    to = Time.current.at_end_of_day
    from = (to - 6.day).at_beginning_of_day

    @posts = Post.where(created_at: from...to).find(Bookmark.group(:post_id).order('count(post_id) desc').limit(8).pluck(:post_id))
    @tags = Tag.find(PostTag.group(:tag_id).order('count(post_id) desc').limit(10).pluck(:tag_id))
    
  end

  def help
  end

  def privacy
  end

  def terms
  end

end
