class PostsController < ApplicationController

  before_action :authenticate, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:current_user]
    @post.strip_link
    if @post.save
      redirect_to(posts_path)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  # def search
  #   @post = Post.where(':')
  # end

  def edit
    @post = Post.find(params[:id])
    redirect_to posts_path unless session[:current_user] == @post.user_id
  end

  def update
    @post = Post.find(params[:id])
    if @post.user_id == session[:current_user] #if you authored the post
        @post.update(post_params) # save with post paramaters
        @post.strip_link # calls strip_link method on @post instance variable
        @post.save
        redirect_to(post_path(@post))
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(posts_path)
  end

  private
  def post_params
    params.require(:post).permit(:title, :article, :date, :category, :attachment, :embed_link)
  end

end
