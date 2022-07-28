class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def showAllTasks
    render :json => Task.all
  end

  def findById
    begin
      requiredTask = Task.find(params[:id])
      render json: requiredTask
    rescue ActiveRecord::RecordNotFound
      render json: "No such record exist"
    end
  end

  def addTask
    newTask = Task.new(params.permit(:taskVal,:done))
    newTask.save
    render json: "Successfully Added"
  end

  def updateById
    begin
      task = Task.find(params[:id])
      task.update(taskVal: params[:taskVal], done: params[:done])
      render json: "Successfully Updated"
    rescue ActiveRecord::RecordNotFound
      render json: "No such record exist"
    end
  end

  def deleteById
    begin
      task = Task.find(params[:id])
      task.destroy
      render json: "Successfully Deleted"
    rescue ActiveRecord::RecordNotFound
      render json: "No such record exist"
    end
  end

end
