class AddAvailableAmountToMonths < ActiveRecord::Migration[7.1]
  def change
    add_column :months, :available_amount, :decimal, as: "total_income - total_expense - total_investment", stored: true
  end
end
