class TodosController < ApplicationController
  def index
    @todos = Todo.all.order(created_at: :desc)
    @completed_todo_count = @todos.where(completed: true).count
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    redirect_to todos_path
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end

  def toggle
    @todo = Todo.find(params[:id])
    @todo.update(completed: !@todo.completed)
    redirect_to todos_path
  end

  def clear_completed
    Todo.where(completed: true).destroy_all
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
