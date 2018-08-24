class BooksController < ApplicationController

 
  def default_url_options
    { locale: 'kk' }          # 所生成的url 都包含的参数 指 XX_path/xx_url
  end                         # 只能是 hash 不能填其它的

  def index
    #reset_session                 # 重置session
    # session.delete(:user_id)     # 删除session 一般赋值为 nil
    puts session[:user_id]
    flash[:primary] = '测试 测试！'    
    @book = Book.first
    @author = @book.author
    render :index
  end

  def show
    puts "#{params[:id]}"
    puts "-==============default_params: #{params['locale']}"

    render html: '<h4>show</show>'
  end

  def edit
    render html: '<h4>编辑页面</h4>'
  end

  def routes_set_params
    #get 'routes_set_params' => 'books#routes_set_params', foo: 'bar'
    puts "---------------foo: #{params[:foo]}"
    render html: '可以吧'
  end

  def arr_params_test
    render html: "---------------#{params[:arr]}"
  end

  def json_data
    puts "-------------json_data: #{params}"

    respond_to do |format|
      format.json {render json: {:success => true}}
    end
  end

  def request_test
    return_content = {
      :host             => request.host.to_s, # 主机名 整个域名
      :domain_2        => request.domain(2).to_s, # 从顶级域名开始 之后两个
      :format           => request.format.to_s,
      :method           => request.method.to_s,
      :post?            => request.post?.to_s,
      :headers          => request.headers.to_s,
      :port             => request.port.to_s,
      :protocol         => request.protocol.to_s, # 返回协议 会加 // 如 http://
      :remote_ip        => request.remote_ip.to_s,
      :url              => request.url.to_s,
      :query_parameters => request.query_parameters.to_s, # 查询字符串
      :request_paramters => request.request_parameters.to_s, # 表单提交字符串
      :path_parameters   => request.path_parameters.to_s  # 路由中参数
    }

    respond_to do |format|
      format.html {render html: return_content}
      format.json {render json: return_content.to_json}
    end

    # http://drf.al.hu.localhost:3000/request_test/hu.json?s=sdaf
    # {
    # "host": "drf.al.hu.localhost",
    # "domain_2": "al.hu.localhost",
    # "format": "application/json",
    # "method": "GET",
    # "post?": "false",
    # "headers": "#<ActionDispatch::Http::Headers:0x007fe4756994c8>",
    # "port": "3000",
    # "protocol": "http://",
    # "remote_ip": "127.0.0.1",
    # "url": "http://drf.al.hu.localhost:3000/request_test/hu.json?s%20=%20%27sdaf%27",
    # "query_parameters": "{\"s \"=>\" 'sdaf'\"}",
    # "request_paramters": "{}",
    # "path_parameters": "{:controller=>\"books\", :action=>\"request_test\", :name=>\"hu\", :format=>\"json\"}"
    # }
  end

  def ajax_page
  end

  def ajax_delete
    render :json => {:result => '已成功送达'}
  end

  def flash_test
    flash[:warning] = '这是警告消息'
    @author = Author.first        
    redirect_to author_books_path(@author)    # @author 必须分开写 不然不能展示
    # 重定向直接 消息 只能是 notice alert flash 这几个
    # redirect_to author_books_path(@author), flash: { referral_code: 1234 }
  end

end
