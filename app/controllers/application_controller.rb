class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except:[:top, :about] #top, aboutの二つのアクションのみ、ログイン無しでもアクセスできるようにする。
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    
    
    def after_sign_in_path_for(resource)
       user_path(current_user) #ログインした直後は、ユーザーの詳細ページに行く
    end
    
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    end
end
