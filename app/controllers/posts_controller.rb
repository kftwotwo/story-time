class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post[:user_id]= current_user.id
    @post[:story_id]= params[:story_id]
    p "new post", @post
    if @post.save
      p "saved!!!"
      redirect_to :back
    else
        p "not saved!!!"
      redirect_to :back
    end
  end

  def edit
  end

  def show
  end

  def index
  end

 private
  def post_params
    params.require(:post).permit(:sentence, :url, :user_id, :story_id)
  end

end
