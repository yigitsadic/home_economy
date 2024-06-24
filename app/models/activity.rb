class Activity < ApplicationRecord
  belongs_to :month

  validates :title, :day_of_month, presence: true
  validates :day_of_month, inclusion: { in: 1..31 }
  validate  :day_of_month_in_boundaries

  def recurring? = recurring

  def day_of_month_in_boundaries
    return if day_of_month.blank? || month.blank?
    
    Date.new(month.year.to_i, Date::MONTHNAMES.index(month.name), day_of_month)
  rescue Date::Error
    errors.add(:day_of_month, "Out of range")
  end
end

