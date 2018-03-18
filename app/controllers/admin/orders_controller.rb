class Admin::OrdersController < Admin::BaseController
  before_action :set_order, only: [:edit, :update, :destroy, :show]

  class InvalidPhotographerAssignment < StandardError; end


  def index
    @orders = Order.all
  end

  def show
  end

  def user
    @orders = Order.where(user_id: params[:id])
    render 'order_user'
  end

  def edit
  end

  def update
    if @order.update(order_params)
      OrderMailer.update_order(@order).deliver_later
      redirect_to admin_order_path, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # ①削除対象を見つける
    # ②削除
    @order.destroy
    # ③削除した後、戻りたい場所を指定
    redirect_to admin_orders_path, notice: 'Order was successfully destroyed'
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(
        :first_name,
        :last_name,
        :date,
        :location,
        :phone_number,
        :comment,
        :area_id,
        :photographer_id,
        :errors,
        :user_id,
        :email,
        addtional_plans_attributes: [:photo_number, :with_illustration]
      )
    end
end
