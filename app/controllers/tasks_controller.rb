class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task,    only: [:show, :edit, :update, :destroy, :event]
  before_action :set_project, only: [:new, :create]
  before_action :creater?,    only: [:edit, :update, :destroy]
  before_action :member?,     only: [:new, :create]

  def index
    if params[:tag]
      @tasks = Task.tagged_with(params[:tag])
    else
      @tasks = current_user.tasks
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.created_tasks.build(task_params.merge({ project: @project }))
    if @task.save
      flash[:success] = 'Task created'
      redirect_to @task
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update_attributes(task_params)
      flash[:success] = 'Task updated'
      redirect_to @task
    else
      flash.now[:warning] = 'Task did not update'
      render :edit
    end
  end

  def destroy
    if @task.destroy
      flash[:success] = 'Task deleted'
      redirect_to root_path
    end
  end

  def event
    @task.send(params[:event])
    redirect_to @task
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :performer_id, :evaluation, :tag_list)
  end

  def set_task
    @task = Task.find_by_id(params[:id])
  end

  def set_project
    @project = Project.find_by_id(params[:project_id])
  end

  def creater?
    redirect_to root_path unless @task.creater?(current_user)
  end

  def member?
    redirect_to @project unless @project.member?(current_user)
  end

end
