class Admin::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [ :edit, :update, :destory]

  class InvalidPhotographerAssignment < StandardError; end

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
    @order.addtional_plans.build
  end

  # Viewで該当するデータを表示等する為にインスタンス変数で取得します。
  # `valida?`および`invalid?`メソッドはバリデーションチェックなどを行うメソッドで、
  # バリデーションチェックがエラーになったら(エラーMSGがあったら)Form入力画面へ差し戻します。

  def confirm
    @order = Order.new(order_params) # <= POSTされたパラメータを取得
    render :new if @order.invalid? #<= バリデーションチェックNGなら戻す
  end

  def back
    @order = Order.new(order_params)

    render :new
  end

  def create
    @order = Order.new(order_params)
      #ActiveRecord::Base.transaction do
        # new: @order.areaでorderモデルに紐付いているareaを呼び出す
        # execute: photographersの配列を作成する
        # photographers = NeabyPhotographerService.new(@order.area).execute

        # 第一段階(計二段階中) - エリアによる絞り込み
    if @order.present?

      PhotographerAutomacitAssignmentService.new(@order).execute

    else
      render :new
    end
  end


  def edit
  end


  def update
    if @order.update(order_params)
      OrderMailer.update_order().deliver_later
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
        :day,
        :location,
        :phone_number,
        :comment,
        :area_id,
        :photographer_id,
        :errors,
        addtional_plans_attributes: [:photo_number, :illust]
      )
    end
end
