class CreateMonths < ActiveRecord::Migration[7.1]
  def change
    create_table :months do |t|
      t.string :name, null: false
      t.string :year, null: false
      t.virtual :full_name, type: :string, as: "name || '/' || year", stored: true

      t.timestamps

      t.index :full_name, unique: true
    end
  end
end

