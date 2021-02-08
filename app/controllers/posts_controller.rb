class PostsController < ApplicationController

  def index
    @posts = policy_scope(Post).order(date_time: :asc)
  end

  def show
    @post = Post.fing(params[:id])
    authorize @post
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:comment, :photo)
  end
end
