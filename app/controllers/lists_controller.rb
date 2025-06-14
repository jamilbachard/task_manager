class ListsController < ApplicationController
  before_action :set_list, only: [ :show, :edit, :update, :destroy ]

  def index
    lists = current_user.lists.includes(:tasks)
    @pagy, @lists = pagy(lists, limit: 25)
    @lists = @lists.decorate
  end

  def show
    @tasks = @list.tasks.ordered
    @tasks = @tasks.completed if params[:filter] == "completed"
    @tasks = @tasks.incomplete if params[:filter] == "incomplete"
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = current_user.lists.build(list_params)

    if @list.save
      redirect_to @list, notice: "List was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: "List was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @list.can_be_deleted?
      @list.destroy
      redirect_to lists_path, notice: "List was successfully deleted."
    else
      redirect_to @list, alert: "Cannot delete list with incomplete tasks."
    end
  end

  private

  def set_list
    @list = current_user.lists.friendly.find(params[:id]).decorate
  end

  def list_params
    params.require(:list).permit(:title, :description)
  end
end
