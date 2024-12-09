class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :set_budget, only: [:new, :create, :index]
  before_action :authenticate_user!

   # GET /budgets/:budget_id/expenses
  def index
    @expenses = @budget.expenses
    @budgets = Budget.all
    @feedback = @budget.generate_ai_content
  end

  # GET /expenses/1
  def show
    @ai_feedback = @expense.generate_ai_content
  end

  # GET /budgets/:budget_id/expenses/new
  def new
    @budget = Budget.find(params[:budget_id])
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
    @expense = Expense.find(params[:id])
  end

  # POST /budgets/:budget_id/expenses
  def create
    unless params[:new_category] == ""
      @category = Category.create!( name:params[:new_category], user_id: current_user.id)
    end
    @expense = Expense.new(expense_params)
    @expense.budget = @budget
    @expense.date = Date.today
    @expense.category = @category if @category
    if @expense.save!
      redirect_to expense_path(@expense), notice: "🤑"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expenses/1
  def update
    if @expense.update(expense_params)
      redirect_to expense_path(@expense), notice: "Edit Successful"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /expenses/1
  def destroy
    @budget = @expense.budget
    @expense.destroy
    redirect_to budget_expenses_path(@budget), notice: "Expense was destroyed."
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  def set_budget
    @budget = Budget.find(params[:budget_id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:amount, :description, :date, :category_id, :new_category)
  end

end
