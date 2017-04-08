class PostsController < ApplicationController
  
  def index
    @posts = Post.all.sort_by{|post| post.votes.count}.reverse 
  end

end