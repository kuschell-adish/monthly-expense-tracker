class AddForeignKeyToExpenses < ActiveRecord::Migration[6.0]
  def change
    add_reference :expenses, :user, index: true, foreign_key: true
  end
end
