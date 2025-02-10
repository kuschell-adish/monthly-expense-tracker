class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.text :notes
      t.decimal :amount
      t.string :category

      t.timestamps
    end
  end
end
