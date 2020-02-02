class ApplicationController < ActionController::Base
    #! devise利用の機能を使用する前にconfigure_permitted_parametersを実行
    before_action :configure_permitted_parameters, if: :devise_controller?

    #! ログインしたらマイページに移動
    def after_sign_in_path_for(resource)
        user_path(current_user.id)
    end

    def configure_permitted_parameters
        #! ユーザー登録の際に、ユーザー名(name)のデータ操作を許可
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
