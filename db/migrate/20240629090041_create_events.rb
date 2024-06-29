class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :description
      t.enum :category, null: false, enum_type: "event_categories"
      t.date :event_date, null: false
      t.enum :event_type, null: false, enum_type: "event_types"
      t.references :month, null: false, foreign_key: true
      t.decimal :financial_value, null: false, default: 0, precision: 8, scale: 2

      t.timestamps
    end
  end
end
