class PostsController < ApplicationController
  
  def index
    @posts = Post.all.sort_by{|post| post.votes.count}.reverse 
  end

  def new
  end

  def create
    new_post = Post.new(post_params)
    new_post.author_id = current_user.id
    if new_post.save
      redirect_to root_path
    else
      @errors = new_post.errors.full_messages
      render 'posts/new'
    end
      
  end

  private
  def post_params
    params.require(:posts).permit(:author_id, :title, :text)
  end

end