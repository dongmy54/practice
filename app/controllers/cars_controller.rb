class CarsController < ApplicationController

  def index
    # render_to_string 将 渲染以 字符串形式返回
    # str = render_to_string :index
    # puts str
    @car = Car.new
    # 渲染原始内容 一般很少用这个
    # render body: 'raw'

    # 不加 html_safe html不能正常表达
    #render html: '<h4>渲染html</h4>'.html_safe, layout: true  # 布局打开
  end

  def d_index
    # 双次渲染会出错 render 并不会 让action终止
    render :index and return if params[:d].present? # and return 可以解决
    render :new
  end

  def new
    # 可以指定 渲染另一个 template 字符串 符号都行
    #render :index
    # render plain: '我准备好啦！'  # 渲染纯文本

    # js 渲染 发给浏览器 字符串
    # render js: 'alert("老大好")'

    # 指定格式 不存在抛错误
    render formats: :xml
  end

  def edit
    render inline: "xml.p ('每一次都这样')", type: :builder # 指定 方式
    # render :inline => "四大天王<%= Author.first.name %>" # 默认 erb 方式渲染
  end

  def show
    # 还可渲染 其它路径下模版
    # render 'balances/new'

    # 还可 访问外部文件 绝对路径 + 视图
    # render file: '/Users/dmy/learn-note/html/disply.html'

    # render json: User.first

    # 不能时单个对象
    # render xml: Balance.all, content_type: 'application/json' # 改变默认响应类型

    # render :show, layout: 'special_layout'  # 指定模版
    # render :show, location: cars_path  # 设置loction 首部

    # 修改状态码
    # render :show, status: :forbidden # 

    # 默认302 
    redirect_to cars_path, status: 301 # 301 永久
  end

  def search
  end

  # 返回首部测试
  def head_test
    # head :bad_requst, location: cars_path # 会500的 不要乱用
  end

  def create
  end

  def update
  end

  def destroy
  end
end
