class AuthorsController < ApplicationController
  # 跳过前置过滤器
  skip_before_action :redirect_admin_user_if_param_include_p, only: [:index,:show]
  # 环绕过滤器
  around_action :wrap_in_transaction, only: :show
  # 多个同名过滤器 按照位置先后执行
  before_action :excute_action1
  before_action :excute_action2
  # 后置过滤器 可以获取到 response
  after_action do |controller|        # 简单过滤器 可以写成块
    puts "-------------response body: #{response.body}"
    puts "-------------response status: #{response.status}"
    puts "-------------response location: #{response.location}" # 重定向url
    puts "-------------response content_type: #{response.content_type}" # 响应类型
    puts "-------------response charset: #{response.charset}"
    puts "-----------response params: #{response.header}" 

    # 设置响应头
    # response.headers["Content-Type"] = "application/pdf"
  end

  def index
    render html: 'author index 页面'
  end

  def show
    puts '---------拉入中'
  end

  def new
    render html: 'new'
  end

  private

    def excute_action1
      puts '---------执行前置过滤1'
    end

    def excute_action2
      puts '----------执行前置过滤2'
    end

    # 环绕过滤器 本质上是将 action 中的动作 拉入块
    def wrap_in_transaction
      ActiveRecord::Base.transaction do
        begin
          puts '---------拉入前'
          yield
          # redirect_to authors_path 也可不要 yield 这样action 就不会执行
          puts '---------拉入后'
        ensure
          puts '---------确保部分'
        end
      end
    end

    

end
