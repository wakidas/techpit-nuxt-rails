class V1::TodosController < ApplicationController
  def index
    todo = Todo.all
    render json: todo
  end

  def create
    todo = Todo.new(todo_params)
    puts 'create!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    puts todo
    if todo.save
      # puts 'save成功'
      render json: todo
    else
      # puts 'save失敗'
      render json: todo.errors
    end

  end

  def destroy
    todo = Todo.find(params[:id])
    if todo.destroy
      render json: todo
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :user_id)
  end
end
