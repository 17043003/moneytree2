class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.references :user, null: false
      t.references :budget, null: false
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
