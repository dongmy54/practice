class BalancesController < ApplicationController

  before_action :special_person_special_page, only: :local_page_t
  # xml builder模版测试
  def index
    @balance  = Balance.first
    @balances = Balance.all
  end

  # patial
  def index1
    @balances = Balance.all
  end

  # 局部布局
  def index2 
    @balance = Balance.first
  end

  # 优先查找视图路径
  def index3
    # 在controller action 或 前置过滤器中用都行
    prepend_view_path 'app/views/prepends_test'
  end

  # 添加视图路径 在已有的路径上添加
  def index4
    append_view_path 'app/appends_test'
  end

  # 图片展示
  def index5
  end

  def new
    @balance = Balance.first
  end

  # 表单相关辅助方法
  def form_relates
    @balance = Balance.new
    @author  = Author.new
  end

  # 第二部分 辅助方法
  def form_tag
    
  end

  # json jbuilder模版
  def show
    @balance = Balance.last
  end

  def edit
    @head = 'this is head'
  end

  def local_page_t
  end

  private
    def special_person_special_page
       I18n.locale = :expert if current_user.expert?
      # 本地话视图 模版名 + .special 需要配置可用 本地
      I18n.locale = :special if params[:special] == 'dmy'
    end

end