class BudgetsController < ApplicationController
    before_action :set_budget, only: [:show, :update, :edit, :destroy]
    before_action :authenticate_user!


    def index
      @budgets = current_user.budgets

    end

    def show
    end

    def new
      @budget = current_user.budgets.build
    end

    def edit
    end

    def create
      @budget = current_user.budgets.build(budget_params)
      if @budget.save
        redirect_to @budget, notice: "Budget was create."
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
      redirect_to budget_url, notice: budget was destroy
    end

    private

    def set_budget
      @budget = current_user.budgets.find(params[:id])
    end

    def budget_params
      params.require(:budget).permit(:total_amount, :month)
    end
  end
end

