class Public::FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_customer.favorites.new(post_id: post.id)
    favorite.save
    redirect_to public_post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_customer.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to public_post_path(post)
  end

  private
  def post_params
    params.require(:post).permit(:post_text)
  end

end
