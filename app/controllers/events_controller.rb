class EventsController < ApplicationController
  before_action :set_month
  
  def expenses
    @events = @month.events.expense.order(event_date: :asc)
  end

  private

  def set_month
    @month = Month.find(params[:month_id])
  end
end
