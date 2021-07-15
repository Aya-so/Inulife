class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  #ログアウト後遷移先
  def after_sign_out_path_for(resource_or_scope)
    return new_admin_session_path if resource_or_scope == :admin
    root_path
  end

  #ログイン後遷移先
  def after_sign_in_path_for(resource)
    case resource
      when Admin                    #管理者
        admin_users_path
      when User                     #会員
        root_path
    end
  end

  #サインアップ後の遷移先はregistrations_controllerに記載

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name, :introduction, :name_id, :profile_image])
  end

end
