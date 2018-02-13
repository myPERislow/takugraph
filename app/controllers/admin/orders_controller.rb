class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
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
    @order = Order.find(params[:id])
  end


  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      redirect_to admin_order_path, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # ①削除対象を見つける
    @order = Order.find(params[:id])
    # ②削除
    @order.destroy
    # ③削除した後、戻りたい場所を指定
    redirect_to admin_orders_path, notice: 'Order was successfully destroyed'
  end

  private

    def order_params
      params.require(:order).permit(:first_name, :last_name, :day, :location,:phone_number, :comment)
    end
end
