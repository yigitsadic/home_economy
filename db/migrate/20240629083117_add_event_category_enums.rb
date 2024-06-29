class AddEventCategoryEnums < ActiveRecord::Migration[7.1]
  def change
    create_enum :event_categories, %w(income expense investment informatic)
    create_enum :event_types, %w(one_time recurring)
  end
end

