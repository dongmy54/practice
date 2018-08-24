require 'prawn' # 转pdf 重启server

class UsersController < ApplicationController
  before_action Filter       # 自定义的 过滤器（单独类） 不要加符号
  # 任意流 实时流
  include ActionController::Live

  def index
  end

  def profile
    render html: "<p>profile test</p>"
  end

  def show
    @user = User.find_by_id(User.ids.sample)

    respond_to do |format|
      format.html  # 什么也不接 即默认
      format.pdf do
        # render pdf: generate_pdf(@user) # 经过测试这种不可行 会要求模版
        send_data generate_pdf(@user),filename: '下载文件.pdf', type: "application/pdf"
      end
    end
  end

  def create_author
    author = Author.new(name: params[:name])
    if author.save
      flash[:success] = "作者: #{author.name}创建成功"
      redirect_to users_path
    end
  end

  def download_pdf
    user = User.find_by_id(User.ids.sample)
    
    # send_data 发送一个生成的文件
    send_data generate_pdf(user),filename: '下载文件.pdf', type: "application/pdf"
                                # ,disposition: 'inline' 以内联非 下载方式显示
  end

  def download_file
    # 下载一个 存在的文件
    # PS： Rails.root 返回 当前项目在本机路径  #<Pathname:/Users/dmy/blog>
    send_file '/Users/dmy/Documents/问题反馈.pages',
               filename: '测下下.pages' # type 可省
  end

  def arbitrary_stream
    response.headers['content-type'] = 'text/event-stream'

    begin
      60.times do 
        response.stream.write "hello dmy\n"
        sleep 1
      end
    ensure
      response.stream.close  # 必须高关闭
    end
  end

  private

    def name_is_dmy?
      rand_user = User.find_by_id(User.ids.sample)
      rand_user.name == 'dmy'
    end

    def set_dmy_cookie
      cookies[:name] = '大哥'
    end

    def generate_pdf(user)
      # Prawn::Document.new do
      #   # 创建字体
      #   font_families["msyh"] = {
      #     :normal => { :file => "/System/Library/Fonts/SFNSDisplay.ttf" }
      #   }

      #   #使用已经创建好的字体进行显示
      #   font("msyh") do
      #     text "姓名：#{user.name}"
      #     text "年龄: #{user.age}"
      #     text "地址：#{user.address}"
      #     text "test: content"
      #   end
      # end.render
      Prawn::Document.new do
        text 'title', align: :center
        text "Address: china"
        text "Email: 123456@qq.com"
      end.render
    end
end

