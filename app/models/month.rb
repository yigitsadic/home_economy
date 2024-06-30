class Month < ApplicationRecord
  validates :name, :year, presence: true
  validates :name, uniqueness: { scope: :year }

  has_many :events

  after_create_commit :create_recurring_events

  # Finds or creates current month.
  def self.get_current_month
    name = I18n.t("date.month_names")[Date.current.month]
    year = Date.current.year.to_s
    full_name = "#{name}/#{year}"

    Month.find_or_create_by(name: name, year: year, full_name: full_name)
  end

  def create_recurring_events
    RecurringEvent.create_recurring_events(self)
  end
end

