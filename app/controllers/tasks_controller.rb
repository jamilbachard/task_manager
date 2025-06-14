class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: [ :edit, :update, :destroy, :toggle_complete ]

  def create
    @task = @list.tasks.build(task_params)

    if @task.save
      redirect_to @list, notice: "Task was successfully created."
    else
      respond_to do |format|
        format.html { render @list, status: :unprocessable_entity }
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            "new_task_form",
            partial: "lists/task_form",
            locals: { task: @task, list: @list }
          ), status: :unprocessable_entity
        }
      end
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @list, notice: "Task was successfully updated."
    else
      redirect_to @list, alert: @task.errors.full_messages.join(", ")
    end
  end

  def destroy
    @task.destroy
    redirect_to @list, notice: "Task was successfully deleted."
  end

  def toggle_complete
    @task.update(completed: !@task.completed)
    redirect_to @list, notice: "Task marked as #{@task.completed? ? 'completed' : 'incomplete'}."
  end

  private

  def set_list
    @list = current_user.lists.friendly.find(params[:list_id])
  end

  def set_task
    @task = @list.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed, :priority)
  end
end
