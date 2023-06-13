class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる前に
  # configure_permitted_parametersメソッドが実行される。
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
   user_path(current_user.id)
  end

  protected #protectedは呼び出された他のコントローラからも参照することができる。

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end

