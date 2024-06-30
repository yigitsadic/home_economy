class RecurringEvent < ApplicationRecord
  include CategoryEnum

  validates :name, :category, :day_of_month, presence: true
  validates_inclusion_of :day_of_month, in: 1..31

  def self.create_recurring_events(month)
    RecurringEvent.all.each do |recurring_event|
      event_date = begin
        Date.new(
          month.year.to_i,
          I18n.t("date.month_names").index(month.name),
          recurring_event.day_of_month
        )
      rescue Date::Error, TypeError
        Date.current.end_of_month
      end
      
      Event.create(
        name: recurring_event.name,
        category: recurring_event.category,
        is_recurring: true,
        month: month,
        event_date: event_date,
        financial_value: recurring_event.financial_value
      )
    end
  end
end

