class AddBudgetToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :budget, :decimal, precision: 10, scale: 2
  end
end
