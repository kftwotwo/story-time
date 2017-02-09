class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if User.all == []
      if @current_user != nil
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      else
        nil
      end
    else
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end

  def require_user
    redirect_to '/login' unless current_user
  end
end
