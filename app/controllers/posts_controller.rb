class PostsController < ApplicationController
  def index
    @posts = Post.order(updated_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(params.require(:post).permit(:title, :body))
    redirect_to posts_path
  end
end
