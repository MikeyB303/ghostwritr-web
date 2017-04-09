class PostsController < ApplicationController
  
  def index
    @posts = Post.all.sort_by{|post| post.votes.count}.reverse 
  end

  def show
    @post = Post.find(params[:id])
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

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    post = Post.find_by(id: params[:id])
    post.update_attributes(post_params)
    if post.save
      redirect_to root_path
    else
      @errors = post.errors.full_messages
      render 'posts/edit'
    end
  end

  private
  def post_params
    params.require(:posts).permit(:author_id, :title, :text)
  end

end