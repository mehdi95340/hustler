class CreateBudgets < ActiveRecord::Migration[7.1]
  def change
    create_table :budgets do |t|
      t.references :user, null: false, foreign_key: true
      t.float :total_amount
      t.integer :month

      t.timestamps
    end
  end
end
