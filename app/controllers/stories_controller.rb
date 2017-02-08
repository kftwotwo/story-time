class StoriesController < ApplicationController
  before_action :require_user, only: [:index, :show]

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    @story[:user_id]= current_user.id
    p "new story", @story
    if @story.save
      redirect_to user_stories_path
    else
      redirect_to :back
    end
  end

  def edit

  end


  def show
    @story = Story.find_by_id(params[:id])
    p @story, "asdfasdfasdf"
    @posts = Post.where('story_id' => @story.id)
    @post = Post.new
  end

  def index
      @stories = Story.where('user_id' => current_user.id)
  end

  private
   def story_params
     params.require(:story).permit(:title, :url, :user_id)
   end

end
