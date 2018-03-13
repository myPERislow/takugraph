class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update_user
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end

  def destroy
    # ①削除対象を見つける
    @user = User.find(params[:id])
    # ②削除
    @user.destroy
    # ③削除した後、戻りたい場所を指定
    redirect_to users_path, notice: 'User was successfully destroyed'
  end

  def show
    @user = User.find(params[:id])
  end

  def add_schedule
    @user = User.find(params[:id])
    30.times do
      @user.schedules.build
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_schedule_path(id: params[:id])
  end

  def show_schedule
    @schedules = Schedule.where(user_id: params[:id])
  end

  private
    def user_params
      params.require(:user).permit(
        :email,
        :encrypted_password,
        :role,
        :order_id,
        schedules_attributes: [:target_day, :priority]
      )
    end
end

# timseメソッド
# オブジェクト.times{ |変数|
#   実行する処理1
#   実行sする処理2
# }

# オブジェクト.times do |変数|
#   実行する処理1
#   実行する処理2
# end

# timesメソッドは、変数に「０」から「対象のオブジェクトが持つ数値−１」を順に代入しながら「{」から「}」までの処理を実行します。
# 1回繰り返す毎に１ずつ数値は増加します。「｜変数｜の部分は省略可能です。」

#  具体的には次のようにします
# 10.times {
#   print("Hello\n")
# }
# 上記の場合は10回「{」から「}」までの処理を繰り返します。
