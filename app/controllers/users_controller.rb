class UsersController < ApplicationController
  # ログインしていない時にログイン画面にリダイレクトをかける
  before_action :authenticate_user!

  def index
  end

  def show
  end
end
