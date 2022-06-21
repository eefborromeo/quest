class TasksController < ApplicationController
    before_action :load_category, only: [ :index, :new, :create, :edit, :show, :update, :destroy,]
    before_action :load_task, only: [ :show, :edit, :update, :destroy]
    def index
        redirect_to category_path(@category)
    end

    def show
    end

    def new
        @task = Task.new
    end

    def edit
    end

    def create
        @task = @category.tasks.build(task_params)
        if @task.save 
            redirect_to category_path(@category), notice: 'Task was successfully created.'
        else
            render :new
        end
    end


    def update
        if @task.update(task_params)
            redirect_to category_path(@category), notice: 'Task was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @task.destroy
        redirect_to category_path(@category), notice: 'Task was successfully destroyed.'
    end

    private
    def load_category
        @category = current_user.categories.find(params[:category_id])
    end

    def load_task
        @task = @category.tasks.find(params[:id])
    end

    def task_params
            params.require(:task).permit(:title, :details, :completed, :date)
    end
end
