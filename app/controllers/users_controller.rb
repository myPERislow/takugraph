class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to
  end

  def add_schedule
    @user = User.find(params[:user])
    30.times{ @user.schedule.build }
  end

  def show_schedule
    @schedule = Schdule.where(user_id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :role)
  end
end
