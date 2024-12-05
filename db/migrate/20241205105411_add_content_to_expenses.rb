class AddContentToExpenses < ActiveRecord::Migration[7.1]
  def change
    add_column :expenses, :content, :text
  end
end
