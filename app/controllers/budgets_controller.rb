class BudgetsController < ApplicationController
  before_action :set_budget, only: [:show, :update, :edit, :destroy]

  def index
    @budgets = current_user.budgets
  end

  def show
  end

  def new
    @budget = current_user.budgets.new
  end

  def edit
    @budget = Budget.find(params[:id])
  end

  def create
    @budget = Budget.new(budget_params)
    @budget.user = current_user
    @budget.month = Date.today.month - 1
    if @budget.save!
      redirect_to budget_path(@budget), notice: "Budget was created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @budget.update(budget_params)
      redirect_to @budget, notice: "budget was update"
    end
  end

  def destroy
    @budget.destroy
    redirect_to budget_url, notice: "budget was destroy"
  end


  private

  def set_budget
    @budget = current_user.budgets.find(params[:id])
  end

  def budget_params
    params.require(:budget).permit(:total_amount, :month)
  end

end
# def create
# @budget = current_user.budgets.new(budget_params)
#if @budget.save
# redirect_to @budget, notice: "Budget was create."
# else
#  render :new, status: :unprocessable_entity
#end
#end
