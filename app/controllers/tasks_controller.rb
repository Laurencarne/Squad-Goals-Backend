class TasksController < ApplicationController
#   before_action :validate_flat
#   def index
#     task = Flatmate.find(current_flatmate[:id]).tasks
#     render json: task, except: [:created_at, :updated_at]
#   end
#
#   def show
#     flatmate = current_flatmate
#     task = Task.find_by(id: params[:id])
#     if flatmate.flat_id === task.flat_id
#       render json: task, except: [:created_at, :updated_at]
#     else
#       render json: {error: "Data Not Avaliable"}
#     end
#   end
#
#   def create
#     task = Task.create(task_params)
#     render json: task
#   end
#
#   def update
#     task = current_flatmate.tasks.select { |task| task.id === params[:id] }
#     if task.length > 0
#       task[0].update(task_params)
#       render json: task
#     else
#       render json: {error: "Update Unsuccessful"}
#     end
#   end
#
#   def destroy
#     task = current_flatmate.tasks.select { |task| task.id === params[:id] }
#     if task.length > 0
#       task[0].destroy
#       render json: {message: "Task Successfully Deleted"}
#     else
#       render json: {error: "Delete Unsuccessful"}
#     end
#   end
#
# private
#   def task_params
#     params.require(:task).permit(:flat_id, :name, :avatar, :description)
#   end
end