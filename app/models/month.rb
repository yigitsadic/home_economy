class Month < ApplicationRecord
  validates :name, :year, presence: true
  validates :name, uniqueness: { scope: :year }

  has_many :events, dependent: :destroy

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

  def calculate_metrics
    income_query = Arel.sql("COALESCE(SUM(financial_value) FILTER (WHERE category = 'income'), 0)")
    expense_query = Arel.sql("COALESCE(SUM(financial_value) FILTER (WHERE category = 'expense'), 0)")
    investment_query = Arel.sql("COALESCE(SUM(financial_value) FILTER (WHERE category = 'investment'), 0)")
    
    calculated_income, calculated_expense, calculated_investment = Event
      .where(month: self)
      .pluck(income_query, expense_query, investment_query)[0]

    update!(
      total_income: calculated_income,
      total_expense: calculated_expense,
      total_investment: calculated_investment
    )
  end
end

