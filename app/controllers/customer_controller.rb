class CustomerController < ApplicationController
  before_filter :authenticate_user
  def authenticate_user
    if !session[:user_id]
      redirect_to login_path
    end
  end
    
end
