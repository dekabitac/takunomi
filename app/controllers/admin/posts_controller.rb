class Admin::PostsController < ApplicationController

  def new
    @post = Post.new
    @genres = Genre.all
  end

  def index
    @posts = Post.all
  end

  def create
    @post = post.new(item_params)
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to admin_post_path(@post.id)
    else
      flash[:notice] = "投稿に失敗しました"
      redirect_to new_admin_post_path
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
     flash[:notice] = "商品を更新しました"
    redirect_to admin_post_path(post.id)
  end

  private

  def post_params
    params.require(:post).permit(:post_text)
  end


end
