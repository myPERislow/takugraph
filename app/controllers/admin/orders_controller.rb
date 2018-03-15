class Admin::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [ :edit, :update, :destory]
  before_action :member_not_index, only: [:index]

  class InvalidPhotographerAssignment < StandardError; end

  def index
    @orders = Order.all
  end

  def user
    @orders = Order.where(user_id: params[:id])
    render 'order_user'
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
      @l = []
      PhotographerAutomaticAssignmentService.new(@order,@l).execute

    if @l
      t = @l.sample
    else
      if current_user.present?
        @order.user_id = current_user.id
      end
      @order.save
      OrderMailer.post_order().deliver_later
      flash[:notice] = "申し込みが完了しました"
      redirect_to(root_path) and return
    end

    if t.nil?
      if current_user.present?
        @order.user_id = current_user.id
      end
      @order.save
      OrderMailer.post_order().deliver_later
      flash[:notice] = "申し込みが完了しました"
      redirect_to(root_path) and return
    else
      if current_user.present?
        @order.user_id = current_user.id
      end
      @order.update(photographer_id: t.user_id)
      OrderMailer.photographer_post_order().deliver_later
      flash[:notice] = "申し込みが完了しました"
      redirect_to(root_path) and return
    end

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
        :user_id,
        addtional_plans_attributes: [:photo_number, :illust]
      )
    end

    def member_not_index
      redirect_to user_admin_order_path(current_user)
    end
end
