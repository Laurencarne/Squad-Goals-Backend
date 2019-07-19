class TasksController < ApplicationController
  before_action :validate_flat

  def index
    task = Flatmate.find(current_flatmate[:id]).tasks
    render json: task, except: [:created_at, :updated_at]
  end

  def my_tasks
    tasks = current_flatmate.tasks.select { |task| task.id === current_flatmate.id }
    if tasks.length > 0
      # render json: {message: 'Tasks Found'}
      render json: tasks, except: [:updated_at, :created_at]
    else
      render json: {error: "Data not Avaliable"}
    end
  end

  def create
    task = Task.create(task_params)
    render json: task
  end

  def update
    task = current_flatmate.tasks.select { |task| task.id === params[:flatmate_id] }
    if task.length > 0
      task[0].update(task_params)
      render json: task
    else
      render json: {error: "Update Unsuccessful"}
    end
  end

  def destroy
    task = current_flatmate.tasks.select { |task| task.id === params[:id] }
    if task.length > 0
      task[0].destroy
      render json: {message: "Task Successfully Deleted"}
    else
      render json: {error: "Delete Unsuccessful"}
    end
  end

private
  def task_params
    params.require(:task).permit(:flat_id, :name, :avatar, :description, :flatmate_id, :week)
  end
end
