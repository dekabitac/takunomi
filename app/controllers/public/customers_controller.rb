class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    if current_customer.update(customer_params)
      flash[:notice] = "更新しました"
      redirect_to  public_customer_path(current_customer)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:user_name, :image, :email)
  end

end
