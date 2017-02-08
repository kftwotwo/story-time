class StoriesController < ApplicationController
  before_action :require_user, only: [:index, :show]

  def new
  end

  def edit
  end

  def show

  end

  def index
      @stories = Story.where('user_id' => current_user.id)
  end
end
