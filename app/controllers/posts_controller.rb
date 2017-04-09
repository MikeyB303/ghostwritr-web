class PostsController < ApplicationController
  
  def index
    @posts = Post.all.sort_by{|post| post.votes.count}.reverse 
  end

  def new
  end

  private
  def post_params
    params.require(:posts).permit(:author_id, :title, :text)
  end

end