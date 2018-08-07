Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'  # 中间居然用 #
  get 'welcome/t_haml'

  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  # 控制器 和 方法间用
  get 'products', to: 'products#index'
  get 'products/:id', to: 'products#show', as: 'single_product'

end
