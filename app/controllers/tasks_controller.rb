class TasksController < ApplicationController
    before_action :set_category_id, only: [ :new, :create]
    before_action :set_task_id, only: [:show]

    def show
    end

    def new
    end

    def create
        @task = @category.tasks.create(task_params)
        redirect_to category_path(@category)
    end

    def update
        
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
