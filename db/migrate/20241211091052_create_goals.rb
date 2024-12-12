class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.string :title
      t.float :target_amount
      t.date :due_date
      t.references :user, null: false, foreign_key: true
      t.boolean :achieved

      t.timestamps
    end
  end
end
