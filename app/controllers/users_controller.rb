class UsersController < ApplicationController
	before_action :correct_user,   only: [:edit, :update,:show]  
  def check_email
      @user = User.find_by(:email =>params[:user][:email])
 
      respond_to do |format|
        format.json { render :json => !@user }
      end
    end
	def show
    
		@user = User.find(params[:id])
	end

  	def new
  		@user = User.new
      
  	end

  	def create
      @user =User.new(user_params)
      if @user.save
        
        
        user = User.find_by_email(params[:user][:email])
        log_in user
        redirect_to user
        # redirect_to :action =>'home', :controller => "homes" 
      else
        render 'new'
      end
    end
    def edit
      @user = User.find(params[:id]) 
    end
       
    def update 
      @user = User.find(params[:id]) 
      # @user= User.find(params[:id])
      if @user.update_attributes(user_params)
        redirect_to :action => "show" 
      else
        render 'edit'
      end
    end
  	

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation, :avatar, :phone ,:address )
    end
     def correct_user
      @user = User.find(params[:id])
      if @user.nil?
        redirect_to :action =>'home', :controller => "homes" 
        else
      redirect_to(root_url) unless @user == current_user
    end
    end

    
    
end
