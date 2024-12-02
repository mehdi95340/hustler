class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :set_budget, only: [:new, :create, :index]
  before_action :authenticate_user!

  def index
    @expenses = @budget.expenses
  end

  def show
  end

  def new
    @expense = @budget.expenses.build
  end

  def edit
  end

  def create
    @expense = @budget.expenses.build(expense_params)
    if @expense.save
      redirect_to [@budget, @expense], notice: "Expense was create."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @expense.update(expense_params)
      redirect_to [@budget, @expense], notice: "Expense was updated."
    else
      render :edit, status: :unprocessable_entity
  end
end

def destroy
  @expense.destroy
  redirect_to budget_expenses_url(@budget), notice: "Expense was destroyed."
end


private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def set_budget
    @budget = Budget.find(params[:budget_id])
  end

  def expense_params
    params.require(:expense).permit(:amount, :description, :date, :category_id)
  end
end 
