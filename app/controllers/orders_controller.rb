class OrdersController < ApplicationController
  before_action :authenticate_user!
  after_action :new, only: [:create]

  def new
    @order = current_user.orders.new(residence_id: params[:residence_id])
  end

  def create
    if params[:residence_id]
      @order = current_user.orders.new(user: current_user, residence_id: params[:residence_id])
      @order.update(order_params)
      redirect_to @order.residence
    else
      @order = current_user.orders.new(user: current_user)
      @order.update(order_params)
      redirect_to root_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :phone, :info, :messenger)
  end
end
