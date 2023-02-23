class Public::PostsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
  def new
    @post = Post.new
    @post.post_genres.build
    @genres = Genre.all
  end

  def index
    @posts = Post.all
    if params[:search] == nil
      @post = Post.all
    elsif params[:search] == ""
      @post = Post.all
    else
      if Genre.exists?(genre_name: params[:search])
        @genre = Genre.find_by(genre_name: params[:search])
        @posts = @genre.posts | Post.where("post_text LIKE ? ",'%' + params[:search] + '%')
      else
        @posts = Post.where("post_text LIKE ? ",'%' + params[:search] + '%')
      end
    end
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to public_post_path(@post.id)
    else
      flash[:notice] = "投稿に失敗しました"
      render :index
    end
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_customer_path(current_customer.id)
  end

  private

  def post_params
    params.require(:post).permit(:image, :post_text, post_genres_attributes: [:genre_id])
  end

  def login_check
    unless user_signed_in?
      flash[:alert] = "いいね機能を使用するにはログインしてください"
      redirect_to root_path
    end
  end

end
