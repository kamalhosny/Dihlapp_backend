class SessionsController < ApplicationController
  def create
    if  user = User.find_by(email: session_params[:email])
      @user = User.authenticate(session_params[:email],session_params[:token])
    else
      @user = User.create!(session_params)
    end
    if @user
      session[:user_id] = @user.id
      render json: @user
    else
      render json: @user.errors, status: :unauthorized
    end
    byebug
  end

  def destroy
    session[:user_id] = nil
  end

  def session_params
    params.require(:session).permit(:first_name, :last_name, :email, :token)
  end
end
