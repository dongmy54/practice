class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render html: '成功'
    else
      render html: "失败:#{@todo.errors.full_messages}"  
    end
  end

  private

    def todo_params
      # 单数资源用 todo
      params.require(:todo).permit(:title)
    end

end
