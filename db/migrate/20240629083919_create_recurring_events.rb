class CreateRecurringEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :recurring_events do |t|
      t.string :name, null: false
      t.enum :category, null: false, enum_type: "event_categories"
      t.integer :day_of_month, null: false, limit: 2
      t.decimal :financial_value, null: false, default: 0, precision: 8, scale: 2

      t.timestamps
    end
  end
end
