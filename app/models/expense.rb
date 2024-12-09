class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :budget

  def generate_ai_content
    client = OpenAI::Client.new
    begin
      chatgpt_response = client.chat(parameters: {
        model: "gpt-4",
        messages: [
          { role: "system", content: "You are a lifestyle auditor." },
          { role: "user", content: "I spent #{amount} on #{description}. Can you Rate my spending behavior and judge me on how i can improve my spending activity like you are travis scott with maximum 50 words" }
        ]
      })
      chatgpt_response.dig("choices", 0, "message", "content") || "AI could not provide feedback."
    rescue StandardError => e
      Rails.logger.error("OpenAI API Error: #{e.message}")
      "AI content generation failed."
    end
  end
end
