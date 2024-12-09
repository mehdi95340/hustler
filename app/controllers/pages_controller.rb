
class PagesController < ApplicationController

  # GET /home
  def home
    if current_user
      @current_budget = current_user.budgets.last
      if @current_budget
        @remaining_budget = @current_budget.remaining_budget
        @total_expenses = @current_budget.total_expenses
      else
        @remaining_budget = 0
        @total_expenses = 0
      end
    else
      @current_budget = nil
      @remaining_budget = 0
      @total_expenses = 0
    end
  end

  # GET /dashboard
  def dashboard
    @budgets = current_user.budgets
    @expenses = Expense.all
  end

  # GET /actions
  def actions
  end
end
