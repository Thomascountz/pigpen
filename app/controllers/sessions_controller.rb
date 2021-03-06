class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      flash[:success] = "Welcome, #{@user.name}!"
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid email and/or password."
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "You've been logged out."
    redirect_to root_url
  end
  
end
