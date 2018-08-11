class BooksController < ApplicationController
  
  def index
    puts "params[:id]"
    render :inline => '<h2> hello </h2>'
    # 返回在线 html
  end

  def show
    puts "#{params[:id]}"

    render html: '<h4>show</show>'
  end
end
