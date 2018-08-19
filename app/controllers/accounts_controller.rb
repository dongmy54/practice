class AccountsController < ApplicationController
  def show
    puts "路由默认参数：#{params}" 

    render html: 'account show'
  end

  def bark
    @book = Book.first
    # 响应不同的格式  http://localhost:3000/bark.xml  
    respond_to do |format|
      format.xml  {render xml: Book.all}   # 单个对象 没有to_xml 方法
      format.html {render html: @book}
      format.json {render json: @book}
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
