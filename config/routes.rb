Rails.application.routes.draw do
  get 'orders/index'

  get 'books/delete'

  get 'welcome/index'
  root 'welcome#index'  # 中间用 # root 'controller#action'
  get 'welcome/t_haml'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'arr_params_test' => 'books#arr_params_test'
  post 'json_data'     => 'books#json_data'
  get 'ajax_page'      => 'books#ajax_page'
  delete 'ajax_delete' => 'books#ajax_delete'
  get 'routes_set_params' => 'books#routes_set_params', foo: 'bar' # 设置一个 写死的 参数
  get 'flash_test', to: 'books#flash_test'
  #resources :users
  resources :orders
  # 控制器 和 方法间用
  get 'products', to: 'products#index'
  get 'products/:id', to: 'products#show', as: 'single_product'
  get 'set_cookie', to: 'cookies#set_cookie'
  get 'read_cookie', to: 'cookies#read_cookie'
  post 'create_author', to: 'users#create_author'
  get 'download_pdf', to: 'users#download_pdf'
  get 'download_file', to: 'users#download_file'
  get 'arbitrary_stream', to: 'users#arbitrary_stream'
  get 'first', to: 'accounts#first'
  get 'pravite_pathh', to: 'accounts#second', as: 'redirect_filter_test'
  get 'index1', to: 'balances#index1'
  get 'index2', to: 'balances#index2'
  get 'index3', to: 'balances#index3'
  get 'index4', to: 'balances#index4'
  get 'index5', to: 'balances#index5'

  resources :cars, :photos, :authors, :users, :accounts, :balances # 写成一行
  # 默认情况下 这里会导入users/porfile 路径下 加to 也没用
  get :profile,to: :p,:controller => 'users' 

  # 单数资源 一般 命名（session）也是单数 但映射到控制器仍然为复数
  resource :session
  #resources :sessions # 这样会出现 不同url 进相同路径的情况 同时严重干扰了 helper方法的使用
  resource :todo

  # 命名空间 都加了路径admin
  namespace :admin do # 符号-空间
    root 'users#index'       # 在命名空间中 也可以使用 root
    resources :users
    get '/foo' => '/articles#index'  # 直接指定 controller位置 和 action
    # PS: url 仍然是 /admin/foo   
  end

  # 无论加 命名空间 还是 模块 helper方法不受影响
  # 加controller 层级
  # scope module: 'admin' do
  #   resources :users
  # end
  # 等价  resources :users, module: 'admin'

  # # 加路径前缀
  # scope '/admin' do # 字符串路径
  #   resources :articles
  # end
  # # 等价 resources :articles, path: '/admin/articles'
  
  # # 资源嵌套 反应model关联关系
  # # ps： 注意 资源的嵌套和 controller嵌套无关
  # # /authors/:author_id/books/:book_id/edit 本质上是url的叠加
  # 嵌套层级不超过1层
  resources :authors do
    resources :books
  end

  #get 'huds(/:id)', to: 'books#show'   # 这里即可以 接收 /huds  也可以 /huds/25
  # namespace :api do
  #   post 'hu', to: 'users#hu' # 这样写是可以的 会加上 前api
  # end

  #=========================== 浅层嵌套 ================================#
  # 浅层嵌套 （一组添加）
  resources :articles, shallow: true do
    resources :comments
    resources :tags
  end
  # # 与上等价
  # # shallow do
  # #   resources :articles do
  # #     resources :comments
  # #     resources :tags
  # #   end
  # # end

  # # 单个添加浅层嵌套
  # # resources :articles do
  # #   resources :comments, shallow: true
  # # end

  # # 与上等价
  # # resources :articles do
  # #   resources :comments, only: [:index,:new,:create] # 限定嵌套动作
  # # end

  # # resources :comments, only: [:show,:update,:destroy]

  # # 为浅层路由(除 index/new/create) 添加url前导
  # scope shallow_path: 'custome_url' do
  #   resources :employees do
  #     resources :pictures, shallow: true
  #   end
  # end

  # # 为浅层路由 helper方法 添加前缀
  # # scope shallow_prefix: 'custome_helper' do
  # #   resources :employees do
  # #     resources :pictures, shallow: true
  # #   end
  # # end

  # # 一种 复用写法
  # # concern :route1 do
  # #   resources :students
  # # end

  # # concern :route2 do
  # #   resources :photos, only: :index
  # # end

  # # # 等同于 路由嵌套
  # # resources :messages, concerns: :route1     # PS：注意这里concerns 复数

  # # resources :messages1, concerns: :route2

  # # 成员路由
  # resources :routes1 do
  #   member do          # url    /routes1/:id/成员名
  #     get  :first      # helper 成员名_routes1
  #     post :second
  #   end
  # end

  # # resources :routes1 do
  # #   get :first, on: :member     # 只有一个时简略写法
  # # end

  # # 集合路由
  # resources :routes do
  #   collection do       # url /routes/集合名
  #     get :first        # helper 集合名_routes
  #     post :second 
  #   end
  # end
  # # PS: 无论集合路由 还是 成员路由 都依托于原资源路由

  # # new 路由
  # resources :accounts do         # /accounts/new/preview
  #   get 'preview', on: :new      # action preview
  # end                            # helper preview_new_account_path

  # #================================== 非资源路由 ================================#
  # #get 'accounts(/:id)', to: :display  # 不可用？
  # get 'accounts/:id/:user_id', to: "accounts#show"           # 动态片段
  # get 'accounts/:id/with_user/:user_id', to: "accounts#show" # 静态片段
  # get 'accounts/f', to: "accounts#show", defaults: {format: 'json'} # 默认参数

  # # defaults format: 'json' do                 # 块式写法 并且不可以被查询字符串覆盖
  # #   resources :route1_tests
  # # end

  # get 'exit', to: 'accounts#destroy', as: :logout  # as 改的是辅助helper 名

  # # 一个路径 同时响应多种请求方式
  # match 'bark', to: 'accounts#bark', via: [:get,:post] 
  match 'bark', to: 'accounts#bark', via: :all        # 所有请求类型
  match 'request_test/:name', to: 'books#request_test', via: :all

  # # 约束动态片段 
  # get 'hhu/:id', to: "accounts#show", id: /[a-z]3/
  # # get 'hhu/:id', to: 'accounts#show', constraints: {id: /[a-z]3/}  # 等价于上面

  # # 请求约束 利用request 方法做判断
  # get 'kku', to: "accounts#kku", constraints: {subdomain: 'admin'}  # 用法和片段约束 一样

  # # 高级约束
  # get '*path',to: 'accounts#show', contraints: AccountsController.new

  # # 等价写法
  # # get '*path', to: 'accounts#show', contraints: lambda {|request| ['58.250.244.65','58.250.244.62','58.250.244.63'].include?(request.remote_ip)}

  # get '*a/foo/*b', to: 'accounts#wildcard'   # /sdaf/d/foo/ko/lp
  #                                            # params[:a] sdaf/d  params[:b] ko/lp

  # get 'hu/bar', to: 'accounts#bark'

  # # get 'redirect_test', to: redirect('/accounts/2')
  # # get 'redirect_test/:name', to: redirect('/hu/%{name}')   # 将参数 传递给重定向
  # get 'redirect_test', to: redirect('/accounts/2', status: 302)    # 通过 status 修改重定向状态码
  # #get 'redirect_test/:k',to: redirect {|path_params,req|      # 也可接块 但测试不接受 do..end 写法
  # #  "/accounts/#{path_params[:k]}"}
  get "yuy",to: redirect('http://sub.dev:3000/users')    # 里面可以写绝对路径
  # get '你好', to: 'accounts#show'         # 路由中也可使用中文哦 6666

  # match '/application.js', to: MyRackApp, via: :all 接rake
end
