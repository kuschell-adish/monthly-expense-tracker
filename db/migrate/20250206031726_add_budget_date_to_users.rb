class AddBudgetDateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :budget_date, :date
  end
end
