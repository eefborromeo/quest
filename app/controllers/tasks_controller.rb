class TasksController < ApplicationController
    before_action :set_category_id, only: [ :new, :create, :edit, :show, :update, :destroy,]
    before_action :set_task_id, only: [:show, :edit, :update, :destroy]
    def index
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
        @task = @category.tasks.create(task_params)
        redirect_to category_path(@category)
    end


    def update
        if @task.update(task_params)
            redirect_to category_task_path(@category), notice: 'Task was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @task.destroy
        redirect_to category_path(@category), notice: 'Task was successfully destroyed.'
    end

    private
    def set_category_id
        @category = Category.find(params[:category_id])
    end

    def set_task_id
        @task = Task.find(params[:id])
    end

    def task_params
            params.require(:task).permit(:title, :details, :completed, :date)
    end
end
