class StoriesController < ApplicationController
  before_action :require_user, only: [:index, :show]

  def new
    @story = Story.new
    a = rand(300..600)
    b = rand(300..600)
    @url ="https://unsplash.it/"+a.to_s+"/"+b.to_s
  end

  def create
    @story = Story.new(story_params)
    @story[:user_id]= current_user.id
    @story[:votes]= 0;
    if @story.save
      redirect_to user_stories_path
    else
      redirect_to :back
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story= Story.find(params[:id])
      if @story.update(story_params)
        redirect_to user_story_path(@story.id)
      else
        render :edit
      end
  end

  def destroy
     @story = Story.find(params[:id])
     story_posts = Post.where('story_id' => @story.id)
     story_posts.each do |post|
       post.destroy
     end
     @story.destroy
     redirect_to user_stories_path
   end

  def show
    a = rand(300..600)
    b = rand(300..600)
    @url ="https://unsplash.it/"+a.to_s+"/"+b.to_s
    @story = Story.find_by_id(params[:id])
    @posts = Post.where('story_id' => @story.id)
    @post = Post.new
  end

  def index
      @stories = Story.all
      # @stories = Story.where('user_id' => current_user.id)
  end
  def upvote
    @story = Story.find_by_id(params[:story_id])
    @story.liked_by current_user
    redirect_to user_story_path(current_user.id,@story.id)
  end
  def downvote
    @story = Story.find_by_id(params[:story_id])
    @story.unliked_by current_user  
    redirect_to user_story_path(current_user.id,@story.id)
  end

  private
   def story_params
     params.require(:story).permit(:title, :url, :user_id)
   end

end
