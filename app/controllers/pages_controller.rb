class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end
  
  def dashboard
    @budgets = currents_user.budgets
    @expenses = Expense.all
  end

  def actions
  end
  
end
