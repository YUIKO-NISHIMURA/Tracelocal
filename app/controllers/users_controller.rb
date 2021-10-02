class UsersController < ApplicationController
  before_action :set_user, only: [:show, :followings, :followers, :likes]
  
  def show
    @pagy, @posts = pagy(@user.posts)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Signup success"
      redirect_to root_url
    else 
      flash[:danger] = "signup lose"
      render :new
    end 
  end
  
  def edit 
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Update success"
      redirect_to user_url(@user)
    else 
      flash[:danger] = "Update lose"
      render :edit
    end
  end
  
  
  def destroy
    
  end
  
  def followings
    @user = current_user
    @pagy, @followings = pagy(@user.followings)
  end

  def followers
    @pagy, @followers = pagy(@user.followers)
  end
  
  def likes 
    @pagy, @posts = pagy(@user.like_posts)
  end
  
private
  def user_params
    params.require(:user).permit(:name, :email,:password, :password_confirmation, :birthday, :city)
  end 
  
  def set_user
    @user = User.find(params[:id])
  end 
  
  
end
