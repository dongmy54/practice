class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    puts params
  end
end
