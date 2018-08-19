class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception  # 接口测试 可以临时注释掉此行

  # application 中的 过滤器会被其它 controller继承
  # 前置过滤器
  before_action :redirect_admin_user_if_param_include_p

  private

    def redirect_admin_user_if_param_include_p
      if params[:p].present?
        flash[:success] = '由于存在p参数，所以经前置过滤器到这里'
        redirect_to admin_users_path
      end
    end
end
