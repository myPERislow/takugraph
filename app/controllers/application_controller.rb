class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_out_path_for resource
    root_path
  end

  def after_sign_in_path_for(resource)
    show_users_path(resource)
  end

  # def after_update_path_for(resource)
  #   if current_user.member?
  #     root_path
  #   else
  #     show_users_path(resource)
  #   end
  # end


  # public => publicに設定されたメソッドは制限なしに呼び出せる
  # protected => protectedに設定されたメソッドは、そのメソッドを持つオブジェクトがselfであるコンテキスト(メソッド定義式やinstance_eval)でのみ呼び出せます。
  # private => privateに設定されたメソッドは、関数形式でしか呼び出せません。

  # deviseのコントローラーのときに、下記のメソッドを呼ぶ
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  # Devise4において、:sign_upで:nameを許可する例
  devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :area_id])
  # Devise4において、:account_updateで:area_idを許可する例
  devise_parameter_sanitizer.permit(:account_update, keys: [:area_id])
  end
end
