# 跳过 测试 和 模版
# rails g controller admins --no--test-framework --skip-template-engine
class AdminsController < ApplicationController
  USERS = {'dmy' => 'dmy067',
           'hu'  => 'bar'}   # 可定义多个用户

  before_action :authenticate

  private
    def authenticate
      # http 摘要身份认证 
      # PS： 用法和 基本认证相同 只不过安全性更高
      authenticate_or_request_with_http_digest do |username|
        USERS[username]
      end
    end
end
