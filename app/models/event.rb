class Event < ApplicationRecord
  include CategoryEnum
  
  belongs_to :month
  validates :name, :category, :is_recurring, :event_date, presence: true

  def recurring? = is_recurring
  def one_time? = !is_recurring
end

