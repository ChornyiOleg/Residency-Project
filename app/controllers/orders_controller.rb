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
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('turbo', partial: 'orders/form', locals: { residence: @residence })
          ]
        end
      end
    else
      @order = current_user.orders.new(user: current_user)
      @order.update(order_params)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('turbo2', partial: 'orders/form_for_home')
          ]
        end
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :phone, :info, :messenger)
  end
end
