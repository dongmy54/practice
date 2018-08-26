class AccountsController < ApplicationController
  # 异常处理
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_root
  
  def index
  end

  def show
    @account = Account.find(params[:id])
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

  def first
    redirect_to redirect_filter_test_path
  end

  def second
    render html: 'redirect test hk'
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

  private
    def redirect_to_root
      flash[:warning] = "id: #{params[:id]}account 未能找到"
      # 重导会之前页面
      redirect_back(fallback_location: root_path)  #应用位置存在 则回到引用页面（http refer) 否则回退首页
    end

end
