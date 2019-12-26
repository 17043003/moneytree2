class ChangeSpentToDate < ActiveRecord::Migration[5.2]
  def change
    change_column :budgets, :spent_at, :date
  end
end
