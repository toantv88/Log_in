class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_filter :correct_user
  def correct_user
    if params[:id]
      @user = User.find(params[:id])  
      if @user.nil?
        redirect_to :action =>'home', :controller => "homes" 
      else
        redirect_to(root_url) unless @user == current_user
      end
    end
  end
end
