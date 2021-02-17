class PostRepliesController < ApplicationController

  def create
    @post_reply = PostReply.new(post_reply_params)
    @post_reply.user = current_user
    raise

    authorize @post_reply

    if @post_reply.save
      redirect_to events_path
    else
      redirect_to posts_path
    end

  end

  def update

  end

  private

  def post_reply_params
    params.require(:post_reply).permit(:comment, :user_id)
  end
end
