class Event < ApplicationRecord
  include CategoryEnum
  
  belongs_to :month
  validates :name, :category, :event_date, presence: true

  def recurring? = is_recurring
  def one_time? = !is_recurring
end

