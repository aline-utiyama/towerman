class PostsController < ApplicationController

  def index
    @post = Post.new
    @posts = policy_scope(Post).order(created_at: :desc)
    authorize @post
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      redirect_to posts_path
    else
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:comment, :photo)
  end
end
