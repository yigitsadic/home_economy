class AddFinancialActivityFieldsToMonths < ActiveRecord::Migration[7.1]
  def change
    add_column :months, :income_total, :decimal, precision: 10, scale: 2, default: 0, null: false
    add_column :months, :expense_total, :decimal, precision: 10, scale: 2, default: 0, null: false
  end
end

