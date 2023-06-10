class ApplicationController < ActionController::Base
 
# devise利用の機能（ユーザ登録、ログイン認証など）が使われる前に
# configure_permitted_parametersメソッドが実行される。
 before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected #protectedは呼び出された他のコントローラからも参照することができる。
  
  # configure_permitted_parametersメソッドでは、
  # devise_parameter_sanitizer.permitメソッドを使うことで
  # ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可している。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

