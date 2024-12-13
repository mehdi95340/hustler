class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :budget

  def review
    if super.blank?
      generate_ai_content
    else
      super
    end
  end

  def generate_ai_content
    client = OpenAI::Client.new
    begin
      chatgpt_response = client.chat(parameters: {
        model: "gpt-4",
        messages: [
          { role: "system", content: "You are a lifestyle auditor." },
          { role: "user", content: "I spent #{amount}, this is my description: #{description}. Can you Rate my spending behavior and judge me on how i can improve my spending activity like you are travis scott with maximum 50 words" }
        ]
      })
      answer = chatgpt_response.dig("choices", 0, "message", "content") || "AI could not provide feedback."
      update(review: answer)
    return answer
    rescue StandardError => e
      Rails.logger.error("OpenAI API Error: #{e.message}")
      "AI content generation failed."
    end
  end

end
