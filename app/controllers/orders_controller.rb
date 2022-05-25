class OrdersController < ApplicationController
  before_action :authenticate_user!

    def new
        @order = Order.new(user: current_user, residence_id: params[:residence_id])
    end

    def create
        if params[:residence_id]
            @order = Order.new(user: current_user, residence_id: params[:residence_id])
            @order.update(order_params)
        else
            @order = Order.new(user: current_user, residence_id: 1)
            @order.update(order_params_home)
        end
        if @order.save
            flash[:success] = 'Order created!'
            if params[:residence_id]
                redirect_to @order.residence
            else
                redirect_to root_path
            end
        else
            @orders = Order.order created_at: :desc
            redirect_to root_path
        end 
    end

    private

    def order_params
        params.require(:order).permit(:name, :phone, :info)
    end

    def order_params_home
        params.permit(:name, :phone, :info)
    end

    def set_residence
        @residence = Residence.find(params[:residence_id])
    end

end