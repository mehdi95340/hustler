class AddDescriptionToGoals < ActiveRecord::Migration[7.1]
  def change
    add_column :goals, :description, :text
  end
end
