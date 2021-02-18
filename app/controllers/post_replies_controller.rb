class PostRepliesController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @post_reply = PostReply.new

  end

  def create
    @post_reply = PostReply.new(post_reply_params)
    @post_reply.user = current_user
    @post = Post.find(params[:post_id])
    @post_reply.post = @post

    authorize @post_reply

    if @post_reply.save
      redirect_to posts_path
    else
      render :new
    end

  end

  def update

  end

  private

  def post_reply_params
    params.require(:post_reply).permit(:comment, :user_id)
  end
end
