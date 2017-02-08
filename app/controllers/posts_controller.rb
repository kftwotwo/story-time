class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post[:user_id]= current_user.id
    @post[:story_id]= params[:story_id]
    if @post.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def edit
    @post = Post.find(params[:id])
    @story = Story.find(params[:story_id])
  end

  def update
    @story = Story.find(params[:story_id])
    @post= Post.find(params[:id])
      if @post.update(post_params)
        redirect_to user_story_path(current_user.id, @story.id)
      else
        render :edit
      end
  end

  def destroy
     @post = Post.find(params[:id])
     @post.destroy
     redirect_to :back
   end

  def show
  end

  def index
  end

 private
  def post_params
    params.require(:post).permit(:sentence, :url, :user_id, :story_id, :user_id)
  end

end
