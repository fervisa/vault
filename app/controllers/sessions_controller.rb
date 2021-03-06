class SessionsController < ApplicationController
  layout 'login'

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email params[:user][:email]
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You have signed in successfuly"
    else
      @user = User.new email: params[:user][:email]
      flash[:alert] = "Wrong email or password"
      render :new 
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Session closed successfuly"
  end
end
