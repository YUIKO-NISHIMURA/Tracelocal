class PostsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :require_user_logged_in, only: [:new]
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = current_user.posts.build
  end 

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post success"
      redirect_to user_url(current_user)
    else 
      flash.now[:danger] = "Post lose"
      render :new
    end
  end
  
  def update
    if @post.update(post_params)
      flash[:success] = "Post success"
      redirect_to user_url(current_user)
    else 
      flash.now[:danger] = "Post lose"
      render :edit
    end
  end

  
  def destroy
    @post.destroy
    flash[:success] = "Delete success"
    redirect_to root_url
  end


  def followings
    @user = current_user
    @pagy,@posts = pagy(current_user.feed_posts.order(id: :desc))
  end   
  
  
  private
    def post_params
      params.require(:post).permit(:name, :genre, :comment, :station, :image, :image_cache)
    end
    
    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      unless @post 
        redirect_to root_url
      end 
    end 
    

end
