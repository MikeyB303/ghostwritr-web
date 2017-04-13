class PostsController < ApplicationController
  
  def index
    @posts = Post.all.select {|post| post.published?}
    @posts = @posts.sort_by{|post| post.votes.count}.reverse 
  end

  def show
    @post = Post.find(params[:id])
    if !author?(@post) && @post.published? == false
      redirect_to '/'
    end
  end

  def new
  end

  def create
    redirect_to root_path if !logged_in?

    new_post = Post.new(post_params)
    new_post.author_id = current_user.id
    if new_post.save
      redirect_to post_path(new_post)
    else
      @errors = new_post.errors.full_messages
      render 'posts/new'
    end   
  end

  def edit
    @post = Post.find_by(id: params[:id])
    redirect_to root_path if !authorized?(@post.author_id)
  end

  def update
    post = Post.find_by(id: params[:id])
    redirect_to root_path if !authorized?(post.author_id)
    post.assign_attributes(post_params)
    if post.save
      redirect_to post_path(post)
    else
      @errors = post.errors.full_messages
      render 'posts/edit'
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    redirect_to root_path if !authorized?(post.author_id)
    post.votes.destroy_all
    post.comments.destroy_all
    post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:posts).permit(:author_id, :title, :text, :published?)
  end

end