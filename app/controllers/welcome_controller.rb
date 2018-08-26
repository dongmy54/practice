class WelcomeController < ApplicationController
  def index
    # www.admin.localhost:3000 www
    #puts "-------------subdomain: #{request.subdomain}" 
    session[:user_id] = 12 
    flash[:success] = '欢迎光临！'    # 任意键名都是可以的
    # flash.kepp              # 保持 闪现消息
    # flash.keep(:primary)    # 这里是 括号（）
    # render layout: 'special_layout'
  end
  
  def t_haml
  end

end
