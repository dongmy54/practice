class UsersController < ApplicationController
  before_action Filter       # 自定义的 过滤器（单独类） 不要加符号

  def index
  end

  def profile
    render html: "<p>profile test</p>"
  end

  def show
  end

  def create_author
    author = Author.new(name: params[:name])
    if author.save
      flash[:success] = "作者: #{author.name}创建成功"
      redirect_to users_path
    end
  end

  private

    def name_is_dmy?
      rand_user = User.find_by_id(User.ids.sample)
      rand_user.name == 'dmy'
    end

    def set_dmy_cookie
      cookies[:name] = '大哥'
    end
end
