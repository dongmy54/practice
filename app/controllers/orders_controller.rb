class OrdersController < ApplicationController
  
  def index
    puts "-----------controller: #{params[:controller]}"     # 获取 controller 和 action 名字
    puts "-----------action: #{params[:action]}"

    puts "-----------fetch: #{params.fetch(:hu, 'dd')}"  # fetch 找不到的情况下 用第二参数
    if params[:status].to_i == 0
      @orders = Order.place_on_order # 下单
    else
      @orders = Order.shipment # 发货
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def new
    pa = params.permit(:card_number,:status) # 这样也可以限制参数 permit
  
    puts "_-------------p: #{pa}"
    @order = Order.new
  end

  def create    
    @order = Order.new(order_params)
    @order.status = params[:order][:status].to_i
    if @order.save
      redirect_to @order # 直接对象
    else
      render :new
    end
  end

  private
      
    def order_params
      params.require(:order).permit(:payment_type,:card_number)
      # require 表示 params中必须要有 xx键
      # require 只接收一个参数
    end

end
