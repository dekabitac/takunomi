class Public::HomesController < ApplicationController
   before_action :authenticate_customer!, except: [:top, :about]
   before_action :authenticate_admin!, except: [:top, :about]
  def top
    @genres = Genre.all
  end

  def about
    @posts = Post.all
  end


end
