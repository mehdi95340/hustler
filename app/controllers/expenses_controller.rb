class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :set_budget, only: [:new, :create, :index]
  before_action :authenticate_user!

  def index
    @expenses = @budget.expenses
   # @categories = @budget.categories
    @budgets = Budget.all
  end

  def show
  end

  def new
    @budget = Budget.find(params[:budget_id])
    @expense = Expense.new
  end

  def edit
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.budget = @budget
    @expense.date = Date.today
    if @expense.save!
      redirect_to root_path, notice: "🤑"
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
