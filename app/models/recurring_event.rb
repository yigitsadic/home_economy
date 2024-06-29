class RecurringEvent < ApplicationRecord
  enum category: %w(income expense investment informatic)

  validates :name, :category, :day_of_month, presence: true
  validates_inclusion_of :day_of_month, in: 1..31
end
