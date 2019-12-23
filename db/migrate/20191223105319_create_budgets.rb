class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.datetime :spent_at, null: false
      t.integer :amount, null: false
      t.string :note

      t.timestamps
    end
  end
end
