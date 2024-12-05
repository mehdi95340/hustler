class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @current_budget = current_user.budgets.last
    @remaining_budget = @current_budget.remaining_budget
    @total_expenses = @current_budget.total_expenses
  end

  def dashboard
    @budgets = currents_user.budgets
    @expenses = Expense.all
  end

  def actions
  end
end
