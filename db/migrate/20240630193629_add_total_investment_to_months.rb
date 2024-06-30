class AddTotalInvestmentToMonths < ActiveRecord::Migration[7.1]
  def change
    add_column :months, :total_investment, :decimal, null: false, default: 0, precision: 8, scale: 2
  end
end
