class PostsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = current_user.posts.build
    @post.images.build #写真投稿用
  end 

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post success"
      redirect_to user_url(current_user)
    else 
      flash[:danger] = "Post lose"
      render :new
    end
  end
  
  def edit 
    
    
  end 
  def update
    if @post.update(post_params)
      flash[:success] = "Post success"
      redirect_to user_url(current_user)
    else 
      flash[:danger] = "Post lose"
      render :new
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
      params.require(:post).permit(:name, :genre, :comment, :station, images_attributes: [:image_url] )
    end
    
    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      unless @post 
        redirect_to root_url
      end 
    end 

end
