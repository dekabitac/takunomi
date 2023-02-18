class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!, except: [:top, :about,:sign_in]
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
     flash[:notice] = "会員情報を更新しました"
    redirect_to admin_customer_path(customer.id)
  end

  private

  def customer_params
    params.require(:customer).permit(:user_name, :email, :is_deleted)
  end
end
