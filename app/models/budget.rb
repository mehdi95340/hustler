class Budget < ApplicationRecord
  belongs_to :user
  has_many :expenses
  has_many :categories, through: :expenses

  enum month: %i[january february march april may june july august september october november december]

  def self.humanized_months
    {
      january: 0,
      february: 1,
      march: 2,
      april: 3,
      may: 4,
      june: 5,
      july: 6,
      august: 7,
      september: 8,
      october: 9,
      november: 10,
      december: 11
    }
  end

  def total_expenses
    sum = 0
    expenses.each do |expense|
      sum += expense.amount.to_i
    end
    return sum
  end

  def remaining_budget
    total_amount - total_expenses
  end

  def expenses_by_category
    expenses.group(:category).sum(:amount)
  end

  def at_zero?
    remaining_budget <= 0
  end
  # Check if the budget is at zero and handle accordingly
  def check_budget_status
    if @budget.at_zero?
      flash[:alert] = "Your budget is at zero. Please review your expenses."
    else
      ""
    end
  end
end
