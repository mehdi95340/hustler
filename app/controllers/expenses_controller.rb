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

    @ai_feedback = @expense.generate_ai_content
    #  @ client = OpenAI::Client.new
    # chatgpt_response = client.chat(parameters: {
    #   model: "gpt-4o-mini",
    #   messages: [{ role: "Life style Auditor", content: " You are a lifestyle auditor. I'll provide details about my expenses #{@expense.amount}, and you'll judge if they enhance my quality of life while staying financially responsible. Rate my spending and give me tips to strike a better balance."}]
    # })
    #   content = chatgpt_response["choices"][0]["message"]["content"]
  end

  def new
    @budget = Budget.find(params[:budget_id])
    @expense = Expense.new
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.budget = @budget
    @expense.date = Date.today
    if @expense.save!
      redirect_to budget_expenses_path( @budget, @expense ), notice: "🤑"
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
    @budget = @expense.budget
    @expense.destroy
    redirect_to budget_expenses_path(@budget), notice: "Expense was destroyed."
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
