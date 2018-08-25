class BalancesController < ApplicationController

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


  # json jbuilder模版
  def show
    @balance = Balance.last
  end

  def edit
    @head = 'this is head'
  end


end