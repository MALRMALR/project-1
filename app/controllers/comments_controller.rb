class CommentsController < ApplicationController

  before_action :authenticate, only: [:destroy]

  def index
    @comments = Comment.all
  end

  def create
    @post = Post.find(params[:post_id])
    @current_user ||= User.find(session[:current_user])
    @comment = @current_user.comments.create!(comment_params)
    @comment.save
    @post.comments << @comment
    redirect_to post_path(@post)
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @current_user ||= User.find(session[:current_user])
    @comment = @post.comments.find(params[:id])
    if @current_user.id == @comment.user_id
      @comment.destroy
    elsif @current_user.id != @comment.user_id || @current_user.id == nil
      flash[:notice]="You do not have permission to delete this comment!"
    end
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
