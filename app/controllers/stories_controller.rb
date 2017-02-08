class StoriesController < ApplicationController
  before_action :require_user, only: [:index, :show]

  def new
  end

  def edit
  end

  def show
  end

  def index
  end
end
