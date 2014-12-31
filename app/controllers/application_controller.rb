class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  # before_filter :correct_user
  # def correct_user
    # if params[:id]
      # if session[:user_id]
        # @user = User.find(session[:user_id])
        # if @user.nil?
          # redirect_to :action =>'home', :controller => "homes"
        # else
          # redirect_to(root_url) unless @user == current_user
        # end
      # end
    # end
  # end
  
  
  # def authenticate_user
  # unless User.find_by_id(session[:user_id])
  # redirect_to login_url, notice: "Please log in"
  # end
  # end

  # before_filter :authenticate_user
  # def authenticate_user
  # if !session[:user_id]
  # redirect_to :action =>'home', :controller => "homes"
  # end
  # end
 before_filter :authenticate_user
  def authenticate_user
    if !session[:user_id]
      redirect_to login_path
    end
  end
end
