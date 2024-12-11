class Budget < ApplicationRecord
  belongs_to :user
  has_many :expenses
  has_many :categories, through: :expenses
  has_many :goals

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

  def generate_ai_content
    formatted_expenses = expenses.map { |expense| "#{expense[:title]}: $#{expense[:amount]}" }.join(", ")

    client = OpenAI::Client.new
    begin
      chatgpt_response = client.chat(parameters: {
        model: "gpt-4",
        messages: [
          { role: "system", content: "You are a lifestyle auditor." },
          { role: "user", content: "These are my expenses for this month: #{formatted_expenses} and this is my goal: #{current_user.goals.last.title} and it costs #{current_user.goals.last.target_amount}. Can you Rate my spending behavior and provide feedback and steps to be better" }
        ]
      })
      chatgpt_response.dig("choices", 0, "message", "content") || "AI could not provide feedback."
    rescue StandardError => e
      Rails.logger.error("OpenAI API Error: #{e.message}")
      "AI content generation failed."
    end
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

  def saved_amount
    total_expenses = expenses.sum(:amount)
    return total_amount - total_expenses
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
