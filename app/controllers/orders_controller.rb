class OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.addtional_plans.build
  end

  def create
    @order = Order.new(order_params)
      #ActiveRecord::Base.transaction do
        # new: @order.areaでorderモデルに紐付いているareaを呼び出す
        # execute: photographersの配列を作成する
        # photographers = NeabyPhotographerService.new(@order.area).execute

        # 第一段階(計二段階中) - エリアによる絞り込み
    if @order.present?
      # @lはphotographerのorderと一致するdateの配列をphotographer_automatic_assignment_serviceにより格納するためのもの
      @l = PhotographerAutomaticAssignmentService.new(@order).execute

      if @l.present?
        t = @l.sample
      else
        if current_user.present?
          @order.user_id = current_user.id
        end
        @order.save
        OrderMailer.post_order(@order).deliver_later
        flash[:notice] = "申し込みが完了しました"
        redirect_to(root_path) and return
      end

      if t.nil?
        if current_user.present?
          @order.user_id = current_user.id
        end
        @order.save
        OrderMailer.post_order(@order).deliver_later
        flash[:notice] = "申し込みが完了しました"
        redirect_to(root_path) and return
      else
        if current_user.present?
          @order.user_id = current_user.id
        end
        @order.update(photographer_id: t.user_id)
        OrderMailer.photographer_post_order(@order).deliver_later
        flash[:notice] = "申し込みが完了しました"
        redirect_to(root_path) and return
      end
    else
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params) # <= POSTされたパラメータを取得
    render :new if @order.invalid? #<= バリデーションチェックNGなら戻す
  end

  def back
    @order = Order.new(order_params)

    render :new
  end

  private

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
