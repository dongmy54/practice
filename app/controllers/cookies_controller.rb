# rails g controller cookies --no-test-framework 跳过测试文件
class CookiesController < ApplicationController
  def set_cookie
    # 本地 cookie name current_time
    cookies.encrypted[:current_time] = Time.now
    redirect_to read_cookie_path
  end

  def hello
    puts 'hello'
  end

  def read_cookie
    cookies[:published_at] = Date.tomorrow           # 存 时间不会加密
    # encrypted 自动编码 和 解码
    Book.last.update(:published_at => cookies[:published_at]) # 取
    cookies.delete(:published_at)       # 删除cookies中键
    render html: "cookies: #{cookies.encrypted[:current_time]}"
  end

end
