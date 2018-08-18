class AccountsController < ApplicationController
  def show
    puts "路由默认参数：#{params}" 

    render html: 'account show'
  end

  def bark
    respond_to do |format|
      format.html {render html: 'bark 响应'}
      format.json {render json: {:success => true}}
    end
  end

  def kku
    render html: "-------request信息：#{request.subdomain}"
  end

  # 高级约束
  def matches?(request)
    blank_list_ips = ['58.250.244.65','58.250.244.62','58.250.244.63']
    blank_list_ips.include?(request.remote_ip)
  end

  def wildcard
    render html: "-------通配符a: #{params[:a]}; 通配符b: #{params[:b]}"
  end

end
