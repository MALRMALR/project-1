class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params)
    redirect_to post_path(@post)
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  private
  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
