class RemoveEventTypeEnumAndField < ActiveRecord::Migration[7.1]
  def up
    remove_column :events, :event_type
    execute "DROP TYPE event_types;"

    add_column :events, :is_recurring, :boolean, null: false, default: false
  end

  def down
    create_enum :event_types, %w(one_time recurring)
    remove_column :events, :is_recurring
    
    add_column :events, :event_type, null: false, enum_type: "event_types"
  end
end
