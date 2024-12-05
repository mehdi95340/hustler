class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.where(user:current_user)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      redirect_to @category, notice: "Category was create."
    else
      render :new, status: :unprocessable_entity
    end
  end

  #   <div class="field">
  #   <%= form.label :description %>
  #   <%= form.text_field :description %>
  # </div>

  def update
    if @category.update(category_params)
    redirect_to @category, notice: "Category was update."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: "Category was destroyed."
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
