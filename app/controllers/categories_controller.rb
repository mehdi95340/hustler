class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
end

def index
  @categories = Category.all
end

def show

end

def new
  @category = Category.new
end

def edit

end

def create
  @category = Category.new(category_params)
  if @category.save
    redirect_to @category, notice: "Category was create."
  else
    render :new, status: : unprocessable_entity
  end

end
