class AddReviewToBudgets < ActiveRecord::Migration[7.1]
  def change
    add_column :budgets, :review, :text
  end
end
