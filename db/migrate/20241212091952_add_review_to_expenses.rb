class AddReviewToExpenses < ActiveRecord::Migration[7.1]
  def change
    add_column :expenses, :review, :text
  end
end
