class Event < ApplicationRecord
  belongs_to :month
  
  enum category: %w(income expense investment informatic)
  enum event_type: %w(one_time recurring)

  validates :name, :category, :event_type, :event_date, presence: true
end
