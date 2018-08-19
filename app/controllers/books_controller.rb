class BooksController < ApplicationController

 
  def default_url_options
    { locale: 'kk' }          # 所生成的url 都包含的参数 指 XX_path/xx_url
  end                         # 只能是 hash 不能填其它的

  def index
    #reset_session                 # 重置session
    # session.delete(:user_id)     # 删除session 一般赋值为 nil
    puts session[:user_id]
    flash[:primary] = '测试 测试！'    
    @book = Book.first
    @author = @book.author
    render :index
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

  def flash_test
    flash[:warning] = '这是警告消息'
    @author = Author.first        
    redirect_to author_books_path(@author)    # @author 必须分开写 不然不能展示
    # 重定向直接 消息 只能是 notice alert flash 这几个
    # redirect_to author_books_path(@author), flash: { referral_code: 1234 }
  end

end
