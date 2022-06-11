class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /categories
  def index
    @categories = current_user.categories
  end

  # GET /categories/1
  def show
    @no_date = @category.tasks.where(:date => nil, :completed => false)
    @upcoming = @category.tasks.where.not(:date => Date.today).where.not('date < ?', Date.today).where('date > ?', Date.today.end_of_week).where(:completed => false)
    @this_week = @category.tasks.where.not(:date => Date.today).where.not('date < ?', Date.today).where(:date => Date.today.beginning_of_week...Date.today.end_of_week, :completed => false)
    @today = @category.tasks.where(:date => Date.today, :completed => false)
    @overdue = @category.tasks.where('date < ?', Date.today).where(:completed => false)
    @done = @category.tasks.where(:completed => true)
  end

  # GET /categories/new
  def new
    @category = current_user.categories.build
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = current_user.categories.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:category, :user_id)
    end
end
