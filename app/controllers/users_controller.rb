class UsersController < ApplicationController
  # skip_before_filter :authenticate_user , only:[:new, :check_email,:create , :login]
  # before_action :correct_user ,  only: [:edit, :show]
  def check_email
    @user = User.find_by(:email =>params[:user][:email], :name =>params[:name])

    respond_to do |format|
      format.json { render :json => !@user }
    end
  end

  def show
    # Category.joins(:articles)
    @user = User.find(params[:id])
  end

  def new
    @user = User.new

  end

  def create
    @user =User.new(user_params)
    @user.remember_digest = SecureRandom.hex(10)
    if @user.save
      user = User.find_by_email(params[:user][:email])
      log_in user
      redirect_to user
      ExampleMailer.delay.sample_email(@user)
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

  def destroy
    @user = User.find(session[:user_id])
    @user.avatar = nil
    @user.save
    redirect_to user_path(current_user)
  end

  def avatar_download
    @user = User.find(params[:id])
    file_path = @user.avatar_file_name
    if !file_path.nil?
      send_file "#{Rails.root}/public/system/users/avatars/000/000/#{@user.id}/original/#{file_path}", :x_sendfile => true
    else
      redirect_to user_path(current_user)
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  def login_facebook
    user = User.omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    log_in user
    redirect_to :action => 'facebook'
  end

  def facebook
    @token = User.find_by("uid IS NOT NULL")
     i =0
     @user =[]
    @token.each do @token   
      @user << User.koala(@token[i]['token'], @token[i]['uid'])
      i +=1
    end
     # @user = User.koala(@token.token, @token.uid)
  end
end
