class BooksController < ApplicationController

 
  def default_url_options
    { locale: 'kk' }          # 所生成的url 都包含的参数 指 XX_path/xx_url
  end                         # 只能是 hash 不能填其它的

  def index
    puts "#{params[:id]}"
    @book = Book.first
    @author = @book.author
  end

  def show
    puts "#{params[:id]}"
    puts "-==============default_params: #{params['locale']}"

    render html: '<h4>show</show>'
  end

  def edit
    render html: '<h4>编辑页面</h4>'
  end

  def routes_set_params
    #get 'routes_set_params' => 'books#routes_set_params', foo: 'bar'
    puts "---------------foo: #{params[:foo]}"
    puts "-==============default_params: #{params[:locale]}"
    render html: '可以吧'
  end

  def arr_params_test
    render html: "---------------#{params[:arr]}"
  end

  def json_data
    puts "-------------json_data: #{params}"

    respond_to do |format|
      format.json {render json: {:success => true}}
    end
  end

  def ajax_page
  end

  def ajax_delete
    render :json => {:result => '已成功送达'}
  end

end
