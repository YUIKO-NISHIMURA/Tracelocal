class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.favorite(post)
    flash[:success] = "Favorite success"
    redirect_to post_url(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unfavorite(post)
    flash[:success] = "Unfavorite success"
    redirect_to post_url(post)
  end
end
