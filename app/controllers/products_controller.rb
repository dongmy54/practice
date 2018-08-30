class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    puts params
  end

  def new
  end

  def upload
    file = params[:file]

    # 上传文件 保存到rails 下目录 注意这里的 模式
    File.open(Rails.root.join('public','uploads',file.original_filename), 'wb') do |f|
      f << file.read
    end

    flash[:success] = '文件上传成功'
    redirect_to products_path
  end

end
