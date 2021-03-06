class SessionsController < ApplicationController
  skip_before_filter :authenticate_user
  def new
  end

  def create
    user = User.find_by(:email => params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:notice] = 'login error'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end

