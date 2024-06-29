class AddMonthlyMetricsToMonths < ActiveRecord::Migration[7.1]
  def change
    add_column :months, :total_expense, :decimal, precision: 8, scale: 2, null: false, default: 0
    add_column :months, :total_income, :decimal, precision: 8, scale: 2, null: false, default: 0
    add_column :months, :total_value_of_investments, :decimal, precision: 8, scale: 2, null: false, default: 0
  end
end
