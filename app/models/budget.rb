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
    if expenses.any?
      expenses.each do |expense|
        sum += expense.amount.to_i
      end
      return sum
    else
      return 0
    end
  end

  def remaining_budget
    total_amount - total_expenses
  end

  def weekly_expenses
    expenses.select {|expense| expense.date.strftime('%V').to_i == Date.today.strftime('%V').to_i}.map {|expense| expense.amount}.sum
  end

  def expenses_by_category
    expenses.group(:category).sum(:amount)
  end
end
