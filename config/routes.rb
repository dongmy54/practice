Rails.application.routes.draw do
  get 'books/delete'

  get 'welcome/index'
  root 'welcome#index'  # 中间用 #
  get 'welcome/t_haml'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  #resources :users

  # 控制器 和 方法间用
  get 'products', to: 'products#index'
  get 'products/:id', to: 'products#show', as: 'single_product'

  resources :cars, :photos, :authors # 写成一行
  # 默认情况下 这里会导入users/porfile 路径下 加to 也没用
  get :profile,to: :p,:controller => 'users' 

  # 单数资源 一般 命名（session）也是单数 但映射到控制器仍然为复数
  resource :session
  #resources :sessions # 这样会出现 不同url 进相同路径的情况 同时严重干扰了 helper方法的使用
  resource :todo

  # 命名空间 都加了路径admin
  namespace :admin do # 符号-空间
    resources :users
    get '/foo' => '/articles#index'  # 直接指定 controller位置 和 action
    # PS: url 仍然是 /admin/foo   
  end

  # 无论加 命名空间 还是 模块 helper方法不受影响
  # 加controller 层级
  scope module: 'admin' do
    resources :users
  end
  # 等价  resources :users, module: 'admin'

  # 加路径前缀
  scope '/admin' do # 字符串路径
    resources :articles
  end
  # 等价 resources :articles, path: '/admin/articles'
  
  # 资源嵌套 反应model关联关系
  # ps： 注意 资源的嵌套和 controller嵌套无关
  # /authors/:author_id/books/:book_id/edit 本质上是url的叠加
  # 嵌套层级不超过1层
  resources :authors do
    resources :books
  end

  #=========================== 浅层嵌套 ================================#
  # 浅层嵌套 （一组添加）
  resources :articles, shallow: true do
    resources :comments
    resources :tags
  end
  # 与上等价
  # shallow do
  #   resources :articles do
  #     resources :comments
  #     resources :tags
  #   end
  # end

  # 单个添加浅层嵌套
  # resources :articles do
  #   resources :comments, shallow: true
  # end

  # 与上等价
  # resources :articles do
  #   resources :comments, only: [:index,:new,:create] # 限定嵌套动作
  # end

  # resources :comments, only: [:show,:update,:destroy]

  # 为浅层路由(除 index/new/create) 添加url前导
  scope shallow_path: 'custome_url' do
    resources :employees do
      resources :pictures, shallow: true
    end
  end

  # 为浅层路由 helper方法 添加前缀
  # scope shallow_prefix: 'custome_helper' do
  #   resources :employees do
  #     resources :pictures, shallow: true
  #   end
  # end

end
