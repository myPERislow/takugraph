class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    if order.save
      redirect_to admin_orders_path, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  def edit
  end


  def update
  end

  def destroy
  end

  private

    def order_params
      params.require(:order).permit(:first_name, :last_name, :day, :location,:phone_number, :phone_number, :comment)
    end
end
