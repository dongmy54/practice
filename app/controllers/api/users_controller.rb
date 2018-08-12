class Api::UsersController < ActionController::Base

  def hu
    render :json => user_params
  end

  private

    def user_params
      # params.require(:user).permit(name: [],sets: {})
      # name：[] 表示接收可以是数组
      # postman 写法 user[name][]

      # sets: {} 表示接收任意键（sets中）
      # permit! 表示接收 所有参数（不做过滤）

      # 嵌套参数
      params.permit(:name,email: [],friends: [:name,
                                               {family: [:name], hobbies: [] }])

      # postman写法 friends[][family][][name] 遇数组[] 遇hash[hash_name]
      
      # params.permit(:name,hus: [:title])
      # 可以响应 数字键 hus[1][title] hus[2][title]
      # {
      #     "name": "s",
      #     "hus": {
      #         "1": {
      #             "title": "1-59"
      #         },
      #         "2": {
      #             "title": "2-145"
      #         }
      #     }
      # }

      # 定制 层级下的任意键
      # ps 这里不能深层嵌套键
      # params.require(:user).permit(:name, data: params[:user][:data].try(:keys))
      # {
      #     "name": "s",
      #     "data": {
      #         "hu": "456",
      #         "bar": "456",
      #         "ji": "1235"
      #     }
      # }
    end
end
