class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
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

  def destroy
    
  end
  
private
  def user_params
    params.require(:user).permit(:name, :email,:password, :password_confirmation, :birthday, :city)
  end 
end
