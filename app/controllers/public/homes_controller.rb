class Public::HomesController < ApplicationController
   before_action :authenticate_customer!, except: [:top, :about]
  def top
    @genres = Genre.all
    @posts = Post.all
  end

  def about
  end


end
