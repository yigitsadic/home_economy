class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :title, null: false
      t.string :expanded_description
      
      t.boolean :recurring, null: false, default: false
      
      t.integer :day_of_month, null: false
      
      t.boolean :financial_activity, null: false, default: true
      t.decimal :amount, null: false, precision: 10, scale: 2, default: 0
      
      t.references :month, null: false, foreign_key: true
      t.timestamps
      t.check_constraint "(day_of_month >= 1 AND day_of_month <= 31)", name: :respect_months_boundaries
    end
  end
end
