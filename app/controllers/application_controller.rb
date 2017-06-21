class ApplicationController < ActionController::API
  before_action :current_user
  def current_user
    @current_user = User.first
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
