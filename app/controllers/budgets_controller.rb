class BudgetsController < ApplicationController
  before_action :set_budget, only: [:show, :update, :edit, :destroy]

  # GET /budgets
  def index
    @budgets = current_user.budgets
  end

  # GET /budgets/1
  def show
  end

  # GET /budgets/new
  def new
    @budget = current_user.budgets.new
  end

  # GET /budgets/1/edit
  def edit
    @budget = Budget.find(params[:id])
  end

  # Post /budgets
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

  # PATCH/PUT / budgets/1
  def update
    if @budget.update(budget_params)
      redirect_to @budget, notice: "budget was update"
    end
  end

  # DELETE /budgets/1
  def destroy
    @budget.destroy
    redirect_to budget_url, notice: "budget was destroy"
  end


  private

   # Use callbacks to share common setup or constraints between actions.
  def set_budget
    @budget = current_user.budgets.find(params[:id])
  end

   # Only allow a list of trusted parameters through.
  def budget_params
    params.require(:budget).permit(:total_amount, :month, :budget)
  end
end
