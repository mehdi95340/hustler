class Budget < ApplicationRecord
  belongs_to :user
  has_many :expenses

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
      sum += expense.amount
    end
    return sum
  end
end
